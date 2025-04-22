# tgbot

一个基于 Python 的 Telegram Bot，部署在 Cloudflare Workers 上，实现了零服务器成本的消息处理服务。

## ✨ 功能特性

- **消息回显**：自动将收到的消息前添加「Echo:」并返回。
- **Webhook 支持**：通过 Telegram 的 Webhook 机制接收消息。
- **Cloudflare Workers 部署**：利用 Cloudflare Workers 实现无服务器部署，降低运维成本。

## 🚀 快速开始

### 1. 克隆项目

```bash
git clone https://github.com/xujw3/tgbot.git
cd tgbot
```

### 2. 安装依赖

```bash
pip install -r requirements.txt
```

### 3. 配置环境变量
在项目根目录下创建 `.env` 文件，并添加以下内容

```env
TELEGRAM_TOKEN=
ALIST_BASE_URL=
ALIST_TOKEN=
ALIST_OFFLINE_DIRS=
JAV_SEARCH_API=
ALLOWED_USER_IDS=
CLEAN_INTERVAL_MINUTES=60
SIZE_THRESHOLD=100
```

-`TELEGRAM_TOKEN`：从 [@BotFather](https://t.me/BotFather) 获取的 Bot Token

### 4. 部署到 Cloudflare Workers
使用 [wrangler](https://developers.cloudflare.com/workers/wrangler/) 工具进行部署

```bash
wrangler publish
```
部署成功后，您将获得一个 `*.workers.dev` 的地址

### 5. 设置 Telegram Webhook
使用以下命令设置 Webhook

```bash
curl -X POST https://api.telegram.org/bot<YOUR_BOT_TOKEN>/setWebhook \
     -d url=https://<YOUR_WORKERS_SUBDOMAIN>.workers.dev/endpoint \
     -d secret_token=<YOUR_WEBHOOK_SECRET>
```
请将 `<YOUR_BOT_TOKEN>`、`<YOUR_WORKERS_SUBDOMAIN>` 和 `<YOUR_WEBHOOK_SECRET>` 替换为您的实际值

## 🧪 示例
用户发送消息：

```
Hello, World!
```

Bot 回复：

```
Echo: Hello, World!
```


## 🛠️ 项目结构


```plaintext
tgbot/
├── bot.py             # 主程序文件，处理 Telegram 消息
├── requirements.txt   # Python 依赖列表
├── Dockerfile         # Docker 配置文件（可选）
└── README.md          # 项目说明文档
```


## 📄 许可证

本项目采用 [MIT License](https://raw.githubusercontent.com/xujw3/tgbot/refs/heads/main/LICENSE) 开源发布，您可以自由使用、修改和分发此项目。
