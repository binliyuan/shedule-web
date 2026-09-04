#!/bin/bash
set -e

echo "========================================"
echo "  Schedule Web 环境检查 & 安装脚本"
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

# ---- 1. 检查当前环境 ----
echo "[1/3] 检查当前环境..."
echo ""

NEED_INSTALL=()

check_cmd node   || NEED_INSTALL+=("nodejs")
check_cmd npm    || NEED_INSTALL+=("npm")
check_cmd git    || NEED_INSTALL+=("git")

echo ""

if [ ${#NEED_INSTALL[@]} -eq 0 ]; then
    echo "  所有依赖已安装，跳过安装步骤"
else
    echo "  缺少: ${NEED_INSTALL[*]}"
    echo ""

    # ---- 2. 安装缺失依赖 ----
    echo "[2/3] 安装缺失依赖..."

    apt-get update -y

    for pkg in "${NEED_INSTALL[@]}"; do
        case "$pkg" in
            nodejs|npm)
                if ! command -v node &> /dev/null; then
                    echo "  安装 Node.js 20.x (LTS)..."
                    apt-get install -y ca-certificates curl gnupg
                    mkdir -p /etc/apt/keyrings
                    rm -f /etc/apt/keyrings/nodesource.gpg
                    curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg
                    echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_20.x nodistro main" | tee /etc/apt/sources.list.d/nodesource.list > /dev/null
                    apt-get update -y
                    apt-get install -y nodejs
                fi
                ;;
            git)
                apt-get install -y git
                ;;
        esac
    done
fi

echo ""

# ---- 3. 最终验证 ----
echo "[3/3] 最终验证..."
echo ""
echo "  Node.js: $(node --version 2>/dev/null || echo '未安装')"
echo "  npm:     $(npm --version 2>/dev/null || echo '未安装')"
echo "  Git:     $(git --version 2>/dev/null || echo '未安装')"

echo ""
echo "========================================"
echo "  环境就绪！"
echo "========================================"
echo ""
echo "  启动开发服务器："
echo "    cd /opt/shedule-web"
echo "    npm install"
echo "    npm run dev"
echo ""
echo "  构建生产版本："
echo "    npm run build"
echo "    # 产出在 dist/ 目录，部署到 Nginx 即可"
echo ""
