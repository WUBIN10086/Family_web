#!/bin/bash

# 网站启动脚本
# 使用方法: ./start_server.sh [端口号]
# 默认端口: 8000

PORT=${1:-8000}

echo "🚀 正在启动网站服务器..."
echo "📡 端口: $PORT"
echo "🌐 访问地址: http://你的服务器IP:$PORT"
echo ""
echo "按 Ctrl+C 停止服务器"
echo ""

# 检查 Python 是否安装
if command -v python3 &> /dev/null; then
    python3 -m http.server $PORT
elif command -v python &> /dev/null; then
    python -m http.server $PORT
else
    echo "❌ 错误: 未找到 Python，请先安装 Python"
    exit 1
fi

