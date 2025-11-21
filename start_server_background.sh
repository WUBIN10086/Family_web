#!/bin/bash

# 后台启动网站服务器脚本
# 使用方法: ./start_server_background.sh [端口号]
# 默认端口: 8000

PORT=${1:-8000}
LOG_FILE="server.log"
PID_FILE="server.pid"

echo "🚀 正在后台启动网站服务器..."
echo "📡 端口: $PORT"
echo "📝 日志文件: $LOG_FILE"
echo "🆔 PID 文件: $PID_FILE"
echo ""

# 检查是否已经在运行
if [ -f "$PID_FILE" ]; then
    OLD_PID=$(cat $PID_FILE)
    if ps -p $OLD_PID > /dev/null 2>&1; then
        echo "⚠️  服务器已经在运行 (PID: $OLD_PID)"
        echo "   使用以下命令停止: kill $OLD_PID"
        exit 1
    else
        rm -f $PID_FILE
    fi
fi

# 启动服务器
if command -v python3 &> /dev/null; then
    nohup python3 -m http.server $PORT > $LOG_FILE 2>&1 &
elif command -v python &> /dev/null; then
    nohup python -m http.server $PORT > $LOG_FILE 2>&1 &
else
    echo "❌ 错误: 未找到 Python，请先安装 Python"
    exit 1
fi

# 保存 PID
echo $! > $PID_FILE
PID=$(cat $PID_FILE)

echo "✅ 服务器已启动！"
echo "🆔 进程 ID (PID): $PID"
echo "🌐 访问地址: http://你的服务器IP:$PORT"
echo ""
echo "📋 常用命令:"
echo "   查看日志: tail -f $LOG_FILE"
echo "   停止服务器: ./stop_server.sh"
echo "   查看进程: ps -p $PID"

