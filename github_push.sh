#!/bin/bash

# 检查是否有未提交的更改
if [[ -n $(git status -s) ]]; then
  # 添加所有更改到暂存区
  git add .

  # 获取当前时间作为默认提交信息
  current_time=$(date "+%Y-%m-%d %H:%M:%S")
  commit_message="Auto commit on $current_time"

  # 如果提供了参数，使用第一个参数作为提交信息
  if [ -n "$1" ]; then
    commit_message="$1"
  fi

  # 提交更改
  git commit -m "$commit_message"

  # 推送到远程仓库
  git push origin main

  echo "代码已成功提交并推送到远程仓库。"
else
  echo "没有检测到更改，推送终止。"
fi