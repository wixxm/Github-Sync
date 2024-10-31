#!/bin/bash

# 配置 Git 用户信息
git config --global user.email "419691642@qq.com"
git config --global user.name "wixxm"

# 设置本地文件夹和远程仓库信息
LOCAL_DIR="/opt/github/wikjxwrt-packages"  # 本地文件夹名称
GITHUB_REPO="git@github.com:wixxm/wikjxwrt-packages.git"  # GitHub 仓库的 SSH URL
REMOTE_BRANCH="main"  # 将分支名称更新为远程仓库的默认分支

# 进入本地文件夹
cd "$LOCAL_DIR" || exit

# 初始化 Git 仓库（如果未初始化）
if [ ! -d ".git" ]; then
  git init
  git remote add origin "$GITHUB_REPO"
fi

# 刷新文件状态，添加所有更改
git add -A

# 提交更改（包含时间戳）
timestamp=$(date +"%Y-%m-%d %H:%M:%S")
git commit -m "🌈 Sync - $timestamp" || echo "没有新的更改可提交"

# 强制推送到远程仓库的指定分支
git push --force origin "$REMOTE_BRANCH" || echo "推送失败，请检查 SSH 密钥配置或仓库权限。"

echo "本地文件夹 $LOCAL_DIR 内容已同步到 GitHub 仓库 4。"
