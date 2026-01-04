# ☁️ 云计算技术期末大作业 - 第25组

> **题目 A6**：基于 Docker 的 Nginx 容器化部署与版本管理

![Docker](https://img.shields.io/badge/Docker-2496ED?style=flat-square&logo=docker&logoColor=white)
![Nginx](https://img.shields.io/badge/Nginx-009639?style=flat-square&logo=nginx&logoColor=white)
![Shell](https://img.shields.io/badge/Shell_Script-121011?style=flat-square&logo=gnu-bash&logoColor=white)

## 📂 项目简介
本项目是《云计算技术》课程的期末实验作业。我们基于 Docker 容器技术，实现了一个 Nginx 静态网站的自动化构建与部署系统。项目包含一个自动化 Shell 脚本，支持一键部署、环境清理以及多版本（v1/v2）的无缝切换。

### 👥 小组成员信息
| 班级 | 组号 | 姓名 | 学号 | 分工 |
| :--- | :--- | :--- | :--- | :--- |
| 23大数据1班 | 25 | () | () | 环境搭建、脚本编写 |
| 23大数据1班 | 25 | () | () | 镜像构建、功能验证 |
| 23大数据1班 | 25 | () | () | 文档编写、PPT制作 |

---

## 🛠️ 项目结构
```text
.
├── Dockerfile          # 镜像构建文件 (定义基础镜像与文件复制)
├── run.sh              # 自动化部署脚本 (核心逻辑)
├── src/                # 网页源码目录
│   └── index.html      # 静态入口文件
├── report/             # 实验报告存放目录
│   └── 实验报告.md      # 详细实验过程与排错记录
└── assets/             # 实验截图与素材

```

---

## 🚀 快速开始 (Quick Start)

你可以通过以下命令在任意安装了 Docker 的 Linux 环境下复现本实验。

### 1. 克隆仓库

```bash
git clone [https://github.com/ZZQ-77756/cloud-final-class1-group25-A6.git](https://github.com/ZZQ-77756/cloud-final-class1-group25-A6.git)
cd cloud-final-class1-group25-A6

```

### 2. 添加执行权限

```bash
chmod +x run.sh

```

### 3. 一键部署 (v1 版本)

```bash
./run.sh

```

> **预期结果**：脚本会自动清理旧容器、构建镜像并启动。
> 访问地址：`http://localhost:8080`

### 4. 切换到 v2 版本 (模拟版本更新)

```bash
# 修改页面内容（模拟开发）
echo '<h2>Hello from Version 2!</h2>' >> src/index.html

# 部署 v2
./run.sh v2

```

> **预期结果**：容器自动更新，访问网页将看到 "Version 2" 字样。

---

## ✨ 实现功能亮点

1. **自动化运维脚本 (`run.sh`)**
* 实现了 "Infrastructure as Code" 的理念，将构建、清理、运行命令封装在脚本中。
* 支持参数化构建（如 `./run.sh v2`），方便版本管理。


2. **端口映射 (Port Mapping)**
* 宿主机 `8080` -> 容器 `80`。


3. **数据卷挂载 (Volume Mounting)**
* 挂载 `$(pwd)/src` 到容器内，实现了**修改代码即时生效**（Hot Reload），无需重启容器。


4. **环境变量注入**
* 启动时注入 `STUDENT_NAME=Group25`，并在容器内通过 `docker inspect` 可验证。



---

## 📄 实验报告

关于详细的实验步骤、遇到的 **Alpine 镜像拉取超时** 问题排查以及完整截图，请查阅：
👉 **[实验报告.md](https://www.google.com/search?q=./report/%E5%AE%9E%E9%AA%8C%E6%8A%A5%E5%91%8A.md)**

---

## ⚠️ 注意事项

* 本项目依赖 Docker 环境，请确保 `systemctl status docker` 状态正常。
