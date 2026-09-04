#!/bin/bash
set -e

# 定位项目目录
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
WEB_DIR="$SCRIPT_DIR"
while [ "$WEB_DIR" != "/" ]; do
    [ -f "$WEB_DIR/package.json" ] && break
    WEB_DIR="$(dirname "$WEB_DIR")"
done

if [ ! -f "$WEB_DIR/package.json" ]; then
    echo "错误：找不到 package.json"
    exit 1
fi

echo "========================================"
echo "  Schedule Web 一键部署"
echo "  项目: $WEB_DIR"
echo "========================================"
echo ""

# ---- 1. 安装 Node.js ----
echo "[1/4] 检查 Node.js..."
if command -v node &> /dev/null && command -v npm &> /dev/null; then
    echo "  [OK] Node.js $(node --version), npm $(npm --version)"
else
    echo "  安装 Node.js 20.x..."
    apt-get update -y
    apt-get install -y ca-certificates curl gnupg
    mkdir -p /etc/apt/keyrings
    rm -f /etc/apt/keyrings/nodesource.gpg
    curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg
    echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_20.x nodistro main" | tee /etc/apt/sources.list.d/nodesource.list > /dev/null
    apt-get update -y
    apt-get install -y nodejs
fi
echo ""

# ---- 2. 构建 ----
echo "[2/4] 构建前端..."
cd "$WEB_DIR"
npm install
npm run build
echo "  构建完成 → dist/"
echo ""

# ---- 3. 防火墙 ----
echo "[3/4] 防火墙..."
if command -v ufw &> /dev/null; then
    ufw allow 80/tcp
    echo "  已放行 80 端口"
else
    echo "  请在阿里云安全组放行 80 端口"
fi
echo ""

# ---- 4. 启动服务 ----
echo "[4/4] 启动服务..."

# 停掉之前的进程
pkill -f "node server.js" 2>/dev/null || true
sleep 1

# 后台启动
nohup node server.js > /tmp/schedule-web.log 2>&1 &
SERVER_PID=$!
sleep 2

if kill -0 $SERVER_PID 2>/dev/null; then
    echo "  服务已启动 (PID: $SERVER_PID)"
else
    echo "  启动失败，查看日志: cat /tmp/schedule-web.log"
    exit 1
fi

echo ""
echo "========================================"
echo "  部署完成！"
echo "========================================"
echo ""
echo "  访问地址: http://$(curl -s ifconfig.me 2>/dev/null || echo '你的服务器IP')"
echo ""
echo "  常用命令："
echo "    cat /tmp/schedule-web.log     # 查看日志"
echo "    pkill -f 'node server.js'     # 停止服务"
echo ""
