#!/bin/bash

# 配置您的 GitHub 账户信息
GITHUB_USER="wixxm"         # GitHub 用户名
REPO_NAME="wikjxwrt-packages"               # GitHub 仓库名
REPO_URL="git@github.com:$GITHUB_USER/$REPO_NAME.git"  # 仓库的 SSH URL
LOCAL_DIR="/opt/github/wikjxwrt-packages"  # 本地目录路径

# 检查本地目录是否存在
if [ ! -d "$LOCAL_DIR" ]; then
  echo "本地目录 $LOCAL_DIR 不存在，请确认路径正确。"
  exit 1
fi

# 进入本地目录
cd "$LOCAL_DIR" || exit

# 更新本地仓库与远程仓库的同步状态
git fetch origin

# 获取当前日期和时间
timestamp=$(date +"%Y-%m-%d %H:%M:%S")

# 强制推送本地更改到远程仓库
git add .
git commit -m "🌈 Sync - $timestamp" || echo "没有新的更改可提交"
git push --force origin main

echo "本地文件夹内容已强制同步到 GitHub 仓库 $REPO_NAME。"
