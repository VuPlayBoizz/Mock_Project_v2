
# Mork Project

## 📚 Giới thiệu

**Mork Project** là một hệ thống microservices triển khai trên nền tảng **AWS**, sử dụng **Terraform**, **Docker**, và **Kubernetes**, tích hợp CI/CD với **Jenkins**. Dự án mô phỏng quy trình triển khai hệ thống backend, frontend và database hiện đại, tối ưu cho quy mô doanh nghiệp hoặc các bài toán hệ thống phân tán.

---

## 🎯 Tính năng chính

- ☁️ **Triển khai hạ tầng AWS** với Terraform (EC2, EKS, VPC, IAM, Transit Gateway, etc.)
- 🛠️ **CI/CD Pipeline** tự động hóa với Jenkins
- 🐳 **Dockerized Microservices** (Backend, Database, UI)
- ⚙️ **Quản lý dịch vụ bằng Kubernetes**
- 🌐 **Frontend giao diện ReactJS**
- 🗄️ **Backend API phát triển bằng Spring Boot**
- 🛡️ **Bảo mật và quản lý kết nối VPC hiệu quả**

---

## 🏗️ Kiến trúc hệ thống

```
![Kiến trúc triển khai](https://github.com/user-attachments/assets/f9189909-81c2-4555-bfec-39132d3aa248)

## 🚀 Cài đặt và triển khai

### ⚙️ Yêu cầu hệ thống

- Terraform >= 1.0
- Docker & Docker Compose
- AWS CLI (đã cấu hình credentials)
- Kubectl
- Jenkins Server (hoặc deploy qua module Terraform)

---

### Bước 1: Triển khai hạ tầng AWS EC2 / EKS

```bash
cd Infrastructure/EC2_Instance
terraform init
terraform apply

cd ../EKS_Cluster
terraform init
terraform apply
```

---

### Bước 2: Triển khai Jenkins CI/CD Pipeline

```bash
cd ../Jenkins_Server
terraform init
terraform apply
```

---

### Bước 3: Deploy các dịch vụ microservices lên Kubernetes

```bash
kubectl apply -f Deployment/API-Gateway/
kubectl apply -f Deployment/Backend-Service/
kubectl apply -f Deployment/Database-Service/
kubectl apply -f Deployment/UI-Service/
```

---

## 🗂️ Cấu trúc thư mục

```
Mork-Project/
├── Code/
│   ├── backend-service/      # Spring Boot Backend Service
│   ├── database-service/     # Database microservice (MongoDB)
│   ├── api-gateway/          # API Gatewat
│   └── ui-service/           # ReactJS Frontend
├── Deployment/               # Kubernetes YAML files
│   ├── API-Gateway/
│   ├── Backend-Service/
│   ├── Database-Service/
│   └── UI-Service/
├── Infrastructure/           # Terraform Scripts
│   ├── EC2_Instance/
│   ├── EKS_Cluster/
│   ├── Jenkins_Server/
│   └── VPC_Transit_Gateway/
└── README.md
```

---

## 🛠️ Công nghệ sử dụng

| Công nghệ  | Mô tả                                |
|------------|-------------------------------------|
| **AWS**        | EC2, EKS, VPC, IAM, Transit Gateway |
| **Terraform**  | Infrastructure as Code (IaC) quản lý AWS |
| **Docker**     | Container hóa ứng dụng |
| **Kubernetes** | Quản lý và điều phối container |
| **ReactJS**    | Giao diện người dùng |
| **Spring Boot**| Backend API |
| **MongoDB**    | Quản lý cơ sở dữ liệu |

---

## 🧪 Testing

### Backend Service

```bash
cd Code/backend-service
./mvnw test
```

### UI Service

```bash
cd Code/ui-service
npm test
```

---
