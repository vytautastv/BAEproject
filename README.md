# Secure Password Generator

A modern, responsive web application for generating secure passwords with customisable options. Built with vanilla JavaScript and deployed using Docker and Terraform on AWS.

##  Features

- **Customisable Password Length**: 8-32 characters
- **Character Options**:
  - Uppercase letters (A-Z)
  - Lowercase letters (a-z)
  - Numbers (0-9)
  - Special symbols (!@#$%^&*()_+{}[]<>?/|~)
- **One-Click Copy**: Copy generated passwords to clipboard
- **Responsive Design**: Works on desktop, tablet, and mobile
- **Modern UI**: Clean, intuitive interface with smooth animations

##  Technology Stack

### Frontend
- **HTML5**: Semantic markup
- **CSS3**: Modern styling with flexbox and CSS Grid
- **Vanilla JavaScript**: No frameworks, pure ES6+ JavaScript
- **Responsive Design**: Mobile-first approach

### Backend & Infrastructure
- **Docker**: Containerization for consistent deployment
- **Nginx**: Web server for serving static content
- **Terraform**: Infrastructure as Code (IaC)
- **AWS EC2**: Cloud hosting
- **Amazon Linux 2**: Operating system


## 📦 Local Development

### Prerequisites
- Docker installed
- Modern web browser


# Build and run with Docker
docker build -t password-generator .
docker run -p 8080:80 password-generator

# Access the application
open http://localhost:8080
```

## ☁️ AWS Deployment

### Prerequisites
- AWS account with appropriate permissions
- Terraform installed (version >= 1.0)
- AWS CLI configured

### Quick Deployment
```bash
# Navigate to infrastructure directory
cd infra

# Copy and configure variables
cp terraform.tfvars.example terraform.tfvars
# Edit terraform.tfvars with your settings

# Deploy infrastructure
terraform init
terraform plan
terraform apply
```

### Infrastructure Components
- **EC2 Instance**: t2.micro with Amazon Linux 2
- **Security Group**: HTTP (80), HTTPS (443), SSH (22)
- **Auto-deployment**: User data script installs Docker and runs the app
- **High Availability**: Application starts automatically on instance boot

### Customisation
- Modify `index.html` for UI changes
- Update `Dockerfile` for container configuration
- Adjust `infra/main.tf` for infrastructure changes
