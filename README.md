# 🚀 Terraform WordPress Deployment (Level 2 - Multi-AZ)

This project automates the deployment of a **high-availability WordPress application** across multiple Availability Zones on AWS using Terraform.

---

<img width="1789" height="1899" alt="L2" src="https://github.com/user-attachments/assets/98b8efb0-83c1-4cdd-9caf-22b67cf11b89" />


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
```

---

## 🏗️ Architecture Overview

![Multi-AZ WordPress Architecture](assets/L2fig.png)

### Key Features:
- **Multi-AZ EC2 Instances** for WordPress
- **Application Load Balancer (ALB)** for traffic distribution
- **Launch Template + Auto Scaling Group**
- **Private subnets** for WordPress
- **Bastion Host** in public subnet (for SSH access)
- **No NAT Gateway** (sandbox-safe, cost-efficient)
- **User Data script** for full WordPress provisioning

---

## 🧾 Cost Estimate (AWS Sandbox)

| Resource         | Count | Type         | Monthly Est. |
|------------------|-------|--------------|--------------|
| EC2 Instances    | 3     | t3.micro     | ~$23         |
| EBS Volumes      | 3x8GB | gp2          | ~$2.40       |
| Load Balancer    | 1     | ALB          | ~$22         |
| **Total**        | —     | —            | **~$47.40**  |

[🧮 View AWS Pricing Calculator Estimate](https://calculator.aws.amazon.com/#/estimate?id=3f137de4c272a455bb8976a7a7742a47)

---

## 🧰 Terraform Structure

```bash
.
├── main.tf
├── vpc.tf
├── subnets.tf
├── security.tf
├── alb.tf
├── asg.tf
├── bastion.tf
├── user_data.sh
├── variables.tf
├── outputs.tf
├── assets/
│   └── L2fig.png
