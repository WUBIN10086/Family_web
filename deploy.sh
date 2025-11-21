#!/bin/bash

# 简单的部署脚本
# 使用方法: ./deploy.sh "提交信息"

echo "🚀 开始部署..."

# 检查是否有未提交的更改
if [[ -n $(git status -s) ]]; then
    echo "📝 检测到更改，准备提交..."
    
    # 添加所有更改
    git add .
    
    # 提交（使用传入的参数或默认信息）
    COMMIT_MSG=${1:-"更新网站内容"}
    git commit -m "$COMMIT_MSG"
    
    echo "✅ 已提交更改"
else
    echo "ℹ️  没有检测到更改"
fi

# 推送到 GitHub
echo "📤 推送到 GitHub..."
git push origin main

if [ $? -eq 0 ]; then
    echo ""
    echo "✅ 部署成功！"
    echo "🌐 你的网站将在几分钟后更新："
    echo "   https://WUBIN10086.github.io/Family_web/"
    echo ""
    echo "💡 提示：GitHub Pages 通常需要 1-2 分钟来更新"
else
    echo "❌ 推送失败，请检查网络连接和 Git 配置"
    exit 1
fi

