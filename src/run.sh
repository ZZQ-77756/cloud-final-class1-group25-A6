#!/bin/bash

# 1. 接收参数：如果用户没传参数，默认使用 "v1"
# $1 代表命令行传入的第一个参数
VERSION=${1:-v1}

IMAGE_NAME="my-nginx:$VERSION"
CONTAINER_NAME="my-website"

echo "=== 开始部署流程 (版本: $VERSION) ==="

# 2. 清理旧环境
# 不管旧容器是 v1 还是 v2，只要名字叫 my-website 就删掉，防止冲突
echo "-> [1/3] 清理旧容器..."
docker rm -f $CONTAINER_NAME 2>/dev/null || true

# 3. 构建镜像
echo "-> [2/3] 构建镜像 $IMAGE_NAME ..."
docker build -t $IMAGE_NAME .

# 4. 启动容器
echo "-> [3/3] 启动容器..."
docker run -d \
  -p 8080:80 \
  -v "$(pwd)/src":/usr/share/nginx/html \
  -e STUDENT_NAME="Group25" \
  --name $CONTAINER_NAME \
  $IMAGE_NAME

echo "=== 部署完成！ ==="
echo "当前运行版本: $IMAGE_NAME"
echo "验证地址: http://localhost:8080"
