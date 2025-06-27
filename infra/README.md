# BAE Project - Terraform Infrastructure

This directory contains Terraform configuration to deploy the BAE Project (Secure Password Generator) on AWS EC2.

## Prerequisites

1. **AWS Account** with appropriate permissions
2. **Terraform** installed (version >= 1.0)
3. **AWS CLI** configured with credentials
4. **SSH Key Pair** created in AWS

## Setup Instructions

### 1. Configure AWS Credentials

Make sure you have AWS credentials configured. You can do this in several ways:

**Option A: AWS CLI**
```bash
aws configure
```

**Option B: Environment Variables**
```bash
export AWS_ACCESS_KEY_ID="your_access_key"
export AWS_SECRET_ACCESS_KEY="your_secret_key"
export AWS_DEFAULT_REGION="us-east-1"
```

**Option C: AWS Credentials File**
Create `~/.aws/credentials`:
```ini
[default]
aws_access_key_id = your_access_key
aws_secret_access_key = your_secret_key
```

### 2. Create SSH Key Pair

Create an SSH key pair in AWS (if you don't have one):

```bash
# Generate SSH key locally
ssh-keygen -t rsa -b 2048 -f ~/.ssh/bae-project-key

# Import to AWS (replace with your key name)
aws ec2 import-key-pair \
  --key-name bae-project-key \
  --public-key-material fileb://~/.ssh/bae-project-key.pub
```

### 3. Configure Terraform Variables

Copy the example variables file and customize it:

```bash
cp terraform.tfvars.example terraform.tfvars
```

Edit `terraform.tfvars` with your specific values:

```hcl
aws_region = "us-east-1"
project_name = "bae-project"
instance_type = "t2.micro"
key_pair_name = "bae-project-key"  # Must match your AWS key pair name
docker_image = "bae-project-app"
```

### 4. Deploy the Infrastructure

```bash
# Initialize Terraform
terraform init

# Plan the deployment
terraform plan

# Apply the configuration
terraform apply
```

When prompted, type `yes` to confirm the deployment.

### 5. Access Your Application

After successful deployment, Terraform will output:

- **Public IP** of the EC2 instance
- **Application URL** (http://public-ip)
- **SSH command** to connect to the instance

Wait 2-3 minutes for the instance to fully boot and the application to start, then visit the application URL in your browser.

## Infrastructure Components

- **EC2 Instance**: Amazon Linux 2 with t2.micro instance type
- **Security Group**: Allows HTTP (80), HTTPS (443), and SSH (22) traffic
- **User Data Script**: Automatically installs Docker and deploys the application
- **Docker Container**: Runs the password generator web app on port 80

## Monitoring and Troubleshooting

### Check Application Status

SSH into the instance and check the application:

```bash
# Use the SSH command from terraform output
ssh -i ~/.ssh/bae-project-key.pem ec2-user@<public-ip>

# Check if Docker container is running
docker ps

# Check application logs
docker logs bae-project-app

# Check deployment logs
cat /var/log/app-deployment.log

# Run health check
./health_check.sh
```

### Common Issues

1. **Application not accessible**: Wait 2-3 minutes for full boot process
2. **Docker not running**: Check if Docker service is started
3. **Port 80 blocked**: Verify security group allows HTTP traffic

## Cleanup

To destroy all resources and avoid AWS charges:

```bash
terraform destroy
```

When prompted, type `yes` to confirm.

## Security Notes

⚠️ **Important Security Considerations:**

- The current configuration allows SSH access from anywhere (0.0.0.0/0)
- For production use, restrict SSH access to your IP address
- Consider using HTTPS with a proper SSL certificate
- Review and adjust security group rules based on your requirements

## Cost Estimation

- **t2.micro instance**: ~$8-10/month (varies by region)
- **Data transfer**: Minimal for this application
- **Storage**: Included in t2.micro (8GB EBS)

## Customization

You can customize the deployment by modifying:

- `variables.tf`: Add new variables
- `main.tf`: Modify infrastructure components
- `user_data.sh`: Change the deployment script
- `terraform.tfvars`: Adjust configuration values
