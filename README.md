# 🔐 Smart Static Website (Secure) – Terraform + AWS

This project showcases a secure and scalable static website hosted on **Amazon S3**, fully provisioned with **Terraform**. The infrastructure adheres to AWS's modern best practices by **removing ACLs**, enforcing **bucket policy access**, and leveraging **block public access configurations** the right way.

---

## 🎯 Purpose

To demonstrate the deployment of a **security-focused static site** using AWS services while mastering real-world cloud provisioning and Infrastructure-as-Code (IaC) workflows.

> 🔐 Security isn’t an add-on — it’s built into every layer of this project.

---

## 🛠 Tech Stack

- **Terraform** for infrastructure as code
- **AWS S3** for static site hosting
- **Public Access Block + Bucket Policy** for secure permissions
- **AWS CLI** for file upload
- (Optional) CloudFront, WAF, ACM for next-level security

---

## 📐 Architecture

User Request --> S3 Static Site Bucket (secured by policy, not ACLs)

yaml
Copy
Edit

> ✅ Public access is handled exclusively via a tightly scoped **bucket policy**, not outdated ACLs  
> ✅ S3 Block Public Access settings are managed through Terraform to prevent misconfiguration

---

## 🚀 Deployment Steps

### 🔧 1. Set Variables
Edit `terraform.tfvars`:

```hcl
site_bucket = "smart-static-site-secure"
📦 2. Initialize Terraform
bash
Copy
Edit
terraform init
⚙️ 3. Deploy Infrastructure
bash
Copy
Edit
terraform apply
Outputs will include your public website_url

🌐 4. Upload Static Content
bash
Copy
Edit
aws s3 cp index.html s3://smart-static-site-secure/index.html
aws s3 cp error.html s3://smart-static-site-secure/error.html
✅ Live Demo
🟢 Visit the site at:
http://smart-static-site-secure.s3-website-us-east-1.amazonaws.com

🧠 Key Lessons
AWS S3 ACLs are deprecated in secure environments — avoid them

Bucket Policies are now the preferred method to grant read access

Terraform requires careful ordering (depends_on) to handle resource dependencies

S3 Block Public Access must be aligned with your intent — otherwise Terraform gets blocked even with correct IAM

🧩 What’s Next
🔐 Add CloudFront + SSL (via ACM)

🧱 Add WAF for security filtering

💼 Use this base for hosting personal portfolio projects securely

👨🏽‍💻 Built by
Malcolm Sesay
AWS Cloud • DevOps • Infrastructure-as-Code
www.linkedin.com/in/malcolmsesay

💬 Final Word
"Security-first isn't a slogan — it's a system."
This project proved that understanding access control, cloud region alignment, and infrastructure state is just as important as making things “work.”

