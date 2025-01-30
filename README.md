# 🚀 Terraform EC2 + Jenkins CI/CD Setup  

This project automates the provisioning of an **AWS EC2 instance** with **Jenkins pre-installed** using **Terraform**. It also includes a **Jenkins pipeline** to run Terraform commands for infrastructure deployment.  

---

## 📌 Features  
✅ Deploys an **EC2 instance** with **Jenkins** installed  
✅ Uses **Terraform** for Infrastructure as Code (IaC)  
✅ Configures a **Jenkins CI/CD Pipeline** for automatic deployments  
✅ Manages security groups for **SSH (22) & Jenkins (8080) access**  

---

## 📂 Project Structure  

---

## 🛠 Prerequisites  
- AWS Account with IAM permissions  
- Terraform installed (`terraform -version`)  
- GitHub repository with Terraform code  
- Jenkins installed on EC2  

---

## 🚀 Setup & Deployment  
### 1️⃣ Clone Repository  
```bash
git clone https://github.com/your-repo/terraform-ec2-jenkins.git
cd terraform-ec2-jenkins
