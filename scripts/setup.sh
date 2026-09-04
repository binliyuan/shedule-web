#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
WEB_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"

echo "========================================"
echo "  Schedule Web 一键部署脚本"
echo "  环境检查 → 安装依赖 → 构建 → 部署"
echo "  适用于 Ubuntu 22.04+"
echo "========================================"
echo ""

check_cmd() {
    if command -v "$1" &> /dev/null; then
        echo "  [OK] $1 — $($1 --version 2>&1 | head -1)"
        return 0
    else
        echo "  [X]  $1 — 未安装"
        return 1
    fi
}

# ============================================
# 1. 检查当前环境
# ============================================
echo "[1/6] 检查当前环境..."
echo ""

NEED_NODE=false
NEED_NPM=false
NEED_GIT=false
NEED_NGINX=false

check_cmd node  || NEED_NODE=true
check_cmd npm   || NEED_NPM=true
check_cmd git   || NEED_GIT=true
check_cmd nginx || NEED_NGINX=true

echo ""

# ============================================
# 2. 安装缺失依赖
# ============================================
echo "[2/6] 安装缺失依赖..."

if [ "$NEED_NODE" = false ] && [ "$NEED_NPM" = false ] && [ "$NEED_GIT" = false ] && [ "$NEED_NGINX" = false ]; then
    echo "  所有依赖已安装，跳过"
else
    apt-get update -y

    # Git
    if [ "$NEED_GIT" = true ]; then
        echo "  安装 git..."
        apt-get install -y git
    fi

    # Nginx
    if [ "$NEED_NGINX" = true ]; then
        echo "  安装 nginx..."
        apt-get install -y nginx
        systemctl enable nginx --now
    fi

    # Node.js 缺失 → NodeSource 装完整 node + npm
    if [ "$NEED_NODE" = true ]; then
        echo "  安装 Node.js 20.x (含 npm)..."
        apt-get install -y ca-certificates curl gnupg
        mkdir -p /etc/apt/keyrings
        rm -f /etc/apt/keyrings/nodesource.gpg
        curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg
        echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_20.x nodistro main" | tee /etc/apt/sources.list.d/nodesource.list > /dev/null
        apt-get update -y
        apt-get install -y nodejs

    # Node.js 有但 npm 缺失
    elif [ "$NEED_NPM" = true ]; then
        echo "  Node.js 已安装但缺少 npm，正在安装..."
        if apt-get install -y npm 2>/dev/null; then
            echo "  npm 通过 apt 安装成功"
        elif command -v corepack &> /dev/null; then
            echo "  通过 corepack 启用 npm..."
            corepack enable npm
        else
            echo "  通过官方脚本安装 npm..."
            curl -fsSL https://www.npmjs.com/install.sh | sh
        fi
    fi
fi

echo ""

# ============================================
# 3. 验证环境
# ============================================
echo "[3/6] 验证环境..."
echo ""

ALL_OK=true
for cmd in node npm git nginx; do
    if command -v $cmd &> /dev/null; then
        echo "  [OK] $cmd"
    else
        echo "  [X]  $cmd — 安装失败"
        ALL_OK=false
    fi
done

if [ "$ALL_OK" = false ]; then
    echo ""
    echo "  部分依赖安装失败，请检查上方日志"
    exit 1
fi

echo ""

# ============================================
# 4. 构建前端
# ============================================
echo "[4/6] 构建前端..."
echo "  项目目录: $WEB_DIR"
cd "$WEB_DIR"
npm install
npm run build
echo "  构建完成 → dist/"
echo ""

# ============================================
# 5. 部署到 Nginx
# ============================================
echo "[5/6] 部署到 Nginx..."

rm -rf /var/www/html/*
cp -r "$WEB_DIR/dist/"* /var/www/html/

cat > /etc/nginx/sites-available/default <<'NGINX'
server {
    listen 80;
    server_name _;

    root /var/www/html;
    index index.html;

    location / {
        try_files $uri $uri/ /index.html;
    }

    location /api/ {
        proxy_pass http://127.0.0.1:8012;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
    }
}
NGINX

nginx -t && systemctl restart nginx
echo "  Nginx 配置完成并重启"
echo ""

# ============================================
# 6. 防火墙
# ============================================
echo "[6/6] 检查防火墙..."
if command -v ufw &> /dev/null; then
    ufw allow 80/tcp
    ufw allow 443/tcp
    echo "  已放行 80, 443 端口"
else
    echo "  未检测到 ufw，请在阿里云安全组放行 80 端口"
fi

echo ""
echo "========================================"
echo "  部署完成！"
echo "========================================"
echo ""
echo "  前端地址: http://$(curl -s ifconfig.me 2>/dev/null || echo '你的服务器IP')"
echo "  后端地址: http://$(curl -s ifconfig.me 2>/dev/null || echo '你的服务器IP'):8012"
echo ""
echo "  常用命令："
echo "    nginx -t                    # 检查 Nginx 配置"
echo "    systemctl restart nginx     # 重启 Nginx"
echo "    tail -f /var/log/nginx/error.log  # 查看日志"
echo ""
