#!/bin/bash

# Step 1: 执行 feeds.sh
echo "=== Step 1: 执行 feeds.sh ==="
bash /opt/github/feeds.sh
if [ $? -ne 0 ]; then
  echo "feeds.sh 执行失败，终止脚本。"
  exit 1
fi
echo "feeds.sh 执行完成。"
echo "--------------------------"

# Step 2: 执行 upgithub.sh
echo "=== Step 2: 执行 upgithub.sh ==="
bash /opt/github/upgithub.sh
if [ $? -ne 0 ]; then
  echo "upgithub.sh 执行失败，终止脚本。"
  exit 1
fi
echo "upgithub.sh 执行完成。"
echo "--------------------------"



echo "所有步骤已成功执行。"
