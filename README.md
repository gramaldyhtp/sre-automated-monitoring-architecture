# Highly Available Web Architecture with Automated Monitoring & Self-Healing

This project is a practical implementation of Site Reliability Engineering (SRE) and DevOps principles. It demonstrates how to containerize a web application, orchestrate multiple services, balance network traffic, and build an autonomous monitoring and self-healing mechanism.

## 🏗️ Architecture Overview

The system consists of the following components orchestrated via **Docker Compose**:
1. **Flask Web Application**: A Python-based web service.
2. **Redis**: An in-memory data structure store used to track site hit counts.
3. **Nginx (Load Balancer & Reverse Proxy)**: Acts as the entry point (Port 80), providing Rate Limiting to prevent spam and distributing traffic across multiple Flask containers using a Round Robin algorithm.
4. **Automated Heartbeat Monitor**: A Bash script running via `cron` that acts as a heartbeat check, continuously verifying the application's HTTP status.
5. **Self-Healing Mechanism**: If the monitoring script detects a non-200 HTTP status code, it automatically triggers a Docker restart command to recover the web service without manual intervention.

## 🚀 Key Features Demonstrated
* **Containerization**: `Dockerfile` optimization using Alpine Linux.
* **Orchestration & Scaling**: Horizontally scaling web containers using `docker compose up --scale web=3`.
* **Traffic Management**: Nginx reverse proxy configuration.
* **Security**: Basic rate limiting implementation.
* **Observability & Autonomous Operation**: Custom Bash script for uptime logging and automatic container recovery.

## 🛠️ How to Run Locally

1. Clone this repository:
   ```bash
   git clone <your-github-repo-url>
   cd compose-demo
