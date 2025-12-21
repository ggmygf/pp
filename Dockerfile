# 使用轻量级的 Alpine Linux 镜像
FROM alpine:latest

# 安装必要的依赖：curl（下载）、openssl（生成证书）、bash
RUN apk add --no-cache curl openssl bash

# 设置工作目录
WORKDIR /app

# 将你的脚本复制到镜像中
COPY h.sh .

# 给脚本执行权限
RUN chmod +x h.sh

# 告诉 Northflank Hysteria2 会使用 UDP 端口
# 注意：Northflank 的环境变量 SERVER_PORT 会自动传入脚本
EXPOSE 3035/udp

# 运行脚本
# 使用 ENTRYPOINT 确保信号能传递给 Hysteria 进程
ENTRYPOINT ["/bin/bash", "./h.sh"]
