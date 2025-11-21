#!/bin/bash

# 停止网站服务器脚本

PID_FILE="server.pid"

if [ ! -f "$PID_FILE" ]; then
    echo "⚠️  未找到 PID 文件，服务器可能未运行"
    exit 1
fi

PID=$(cat $PID_FILE)

if ps -p $PID > /dev/null 2>&1; then
    kill $PID
    rm -f $PID_FILE
    echo "✅ 服务器已停止 (PID: $PID)"
else
    echo "⚠️  进程不存在，清理 PID 文件"
    rm -f $PID_FILE
fi

