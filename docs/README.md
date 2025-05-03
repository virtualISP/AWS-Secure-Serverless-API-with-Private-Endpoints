# 🛡️ AWS Secure Serverless API with Private Endpoints ⚡

[![Terraform](https://img.shields.io/badge/terraform-%235835CC.svg?logo=terraform)](https://www.terraform.io/)
[![AWS](https://img.shields.io/badge/AWS-%23FF9900.svg?logo=amazon-aws)](https://aws.amazon.com)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)

This project demonstrates how to build a **Serverless Application** using **AWS Lambda** 🐑, **API Gateway** 🌐, **DynamoDB** 💾, and **Terraform** ⚙️. The API exposes a private endpoint where you can **POST** 📤 data, which is then saved to a **DynamoDB** table. The application uses **Terraform** to manage infrastructure as code.

## 📝 Blog Post

For a detailed walkthrough and architecture explanation, check out my blog post on Medium:  
👉 **[Read the full blog here](https://medium.com/@zer0vuln/building-a-serverless-application-with-private-api-endpoints-a-comprehensive-guide-320dfb05d3ad)**

## 🌟 Features

- 🏰 **VPC Architecture** - Isolated private subnets with no public internet exposure  
- 🔒 **Zero-Trust Security** - IAM least-privilege roles + Security Groups  
- 🚀 **Serverless Components** - API Gateway + Lambda + DynamoDB  
- 🔐 **Private API Access** - VPC Gateway Endpoints for AWS services  
- 📦 **Infrastructure-as-Code** - Terraform modules for reproducibility  
- 💸 **Free-Tier Friendly** - Optimized for AWS Free Tier usage  


## 🏗️ Architecture

The architecture consists of the following AWS services:

- 🌐 **API Gateway**: Exposes a private HTTP API endpoint to handle incoming requests.  
- 🐑 **AWS Lambda**: The function that processes the data and interacts with DynamoDB.  
- 💾 **DynamoDB**: A NoSQL database used to store the incoming data.  
- 🛡️ **IAM Roles**: To ensure appropriate permissions for Lambda and API Gateway.  
- 🔐 **Security Groups**: To define network access control for Lambda.

![Serverless API Endpoint Diagram](https://github.com/virtualISP/AWS-Secure-Serverless-API-with-Private-Endpoints/blob/main/docs/architecture-diagram.png)

### 🔄 High-Level Flow:
1. 📩 **API Gateway** receives the `POST` request.  
2. 🔁 The request is forwarded to **Lambda**.  
3. 🧠 **Lambda** processes the request, stores the data in **DynamoDB**.  
4. 📤 **Lambda** returns the result to **API Gateway**, which forwards it back to the client.

---

## 📂 Project Structure

```
📂 project-root/
├── 📄 main.tf
├── 📄 providers.tf
├── 📄 variables.tf
├── 📄 outputs.tf
├── 📄 terraform.tfvars
├── 📁 modules/
│   ├── 📁 network/
│   │   ├── 📄 main.tf
│   │   ├── 📄 variables.tf
│   │   └── 📄 outputs.tf
│   └── 📁 app/
│       ├── 📄 main.tf
│       ├── 📄 variables.tf
│       ├── 📄 outputs.tf
│       ├── 📄 iam.tf
│       └── 📄 security_groups.tf
├── 📁 lambda-code/
│   ├── 📄 lambda_function.py
│   └── 📄 requirements.txt
└── 📁 docs/
    ├── 📄 architecture-diagram.png  
    └── 📄 README.md

```

---

## 🛠️ Installation

### 1️⃣ Clone the repository
```bash
git clone https://github.com/virtualISP/AWS-Secure-Serverless-API-with-Private-Endpoints.git
cd AWS-Secure-Serverless-API-with-Private-Endpoints
```

### 2️⃣ Package Lambda Code
Before deploying, make sure to package your Lambda function code:

```bash
cd lambda-code
pip install -r requirements.txt -t .
zip -r ../lambda-code/lambda_function.zip .
cd ..
```

### 3️⃣ Configure AWS Credentials
```bash
aws configure
```

### 4️⃣ Initialize Terraform
```bash
terraform init
```

### 5️⃣ Preview Changes
```bash
terraform plan
```

### 6️⃣ Deploy Infrastructure
```bash
terraform apply
```

This will create all the necessary resources, including:

- 🕸️ **VPC** and **Subnet** for Lambda  
- 🌐 **API Gateway** to expose the HTTP endpoint  
- 💾 **DynamoDB Table** to store the data  
- 🐑 **Lambda Function** to handle incoming requests  
- 🛡️ **IAM Roles** for Lambda and API Gateway  

---

### 🚀 Test the API

After deployment, you can test the API using **Postman** or **curl**.

---

### 💥 Cleanup

To tear everything down:

```bash
terraform destroy -auto-approve
```

---

## 🔍 Monitoring

- 📊 **Lambda Logs**: `/aws/lambda/<function-name>`  
- 📈 **API Metrics**: `API-Gateway-Execution-Logs_<api-id>`  
- 🚨 **CloudTrail Alerts**: For security events  

---

## 📦 Prerequisites

- 🐍 Python 3.8+  
- ⚙️ Terraform 1.5+  
- 🔑 AWS CLI configured  
- 🆓 AWS Free Tier account  

---

## 🤝 Contributing

✨ We welcome contributions! Please follow:

1. 🍴 Fork the repo  
2. 🌿 Create your branch (`git checkout -b feature/amazing`)  
3. 💾 Commit changes (`git commit -m 'Add feature'`)  
4. 📤 Push (`git push origin feature/amazing`)  
5. 🔀 Open a PR  

---

## 📜 License

MIT © VirtualISP – **[⚖️ See LICENSE](LICENSE)**

---

> 💡 **Pro Tip**: Use `terraform plan` before `apply` to review changes  
> 🔧 **Troubleshooting**: Check CloudWatch logs for Lambda errors  
> 🌟 **Star this repo** if you found it useful!
```
