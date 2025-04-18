# 使用官方Python3镜像作为基础镜像
FROM python:3.11-slim

# 设置工作目录
WORKDIR /app

# 设置时区为亚洲/上海
RUN apt-get update && apt-get install -y tzdata \
    && ln -fs /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && dpkg-reconfigure -f noninteractive tzdata \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# 复制项目依赖文件
COPY requirements.txt .

# 安装项目依赖
RUN pip install --no-cache-dir -r requirements.txt

# 复制项目代码
COPY . .

# 创建.env文件用于存储环境变量
RUN echo "TELEGRAM_TOKEN=${TELEGRAM_TOKEN}\n\
BASE_URL=${ALIST_BASE_URL}\n\
ALIST_TOKEN=${ALIST_TOKEN}\n\
ALIST_OFFLINE_DIRS=${ALIST_OFFLINE_DIRS}\n\
JAV_SEARCH_API=${SEARCH_URL}\n\
ALLOWED_USER_IDS=${ALLOWED_USER_IDS_STR}\n\
CLEAN_INTERVAL_MINUTES=${CLEAN_INTERVAL_MINUTES}\n\
SIZE_THRESHOLD=${SIZE_THRESHOLD}" > .env

# 设置环境变量
ENV PYTHONUNBUFFERED=1

# 运行应用
CMD ["python", "bot.py"]
