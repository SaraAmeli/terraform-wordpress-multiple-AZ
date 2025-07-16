# 🚀 Terraform WordPress Deployment (Level 2 - Multi-AZ)

This project automates the deployment of a **high-availability WordPress application** across multiple Availability Zones on AWS using Terraform.

---

## 🧩 Architecture Overview

- **Multi-AZ VPC** with both public and private subnets.
- **Bastion Host** (EC2) in public subnet for secure SSH access.
- **WordPress EC2 Instances** in private subnets (across AZs).
- **Application Load Balancer (ALB)** for traffic distribution.
- **Auto Scaling Group (ASG)** for WordPress backend.
- **Security Groups** to allow only necessary traffic.
- **User Data** script to auto-install WordPress.
- **NAT Gateway** can be added (currently omitted for cost control).

---

## 📦 Components

- `vpc.tf` – VPC and subnet configuration
- `security.tf` – Security groups for ALB, Bastion, and WordPress
- `alb.tf` – Load balancer and listener
- `asg.tf` – Launch template and Auto Scaling Group for WordPress
- `bastion.tf` – Bastion EC2 setup
- `user_data.sh` – Script to install WordPress on instance boot
- `outputs.tf` – Key resource outputs
- `variables.tf` – Input variable definitions

---

## 🛠️ Usage

### 1. Clone the repository
```bash
git clone https://github.com/SaraAmeli/terraform-wordpress-multi-az.git
cd terraform-wordpress-multi-az
