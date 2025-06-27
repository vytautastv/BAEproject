# 🔐 Secure Password Generator v3

A modern, responsive web application for generating secure passwords with customizable options. Built with vanilla JavaScript and deployed using Docker and Terraform on AWS.

## ✨ Features

- **Customizable Password Length**: 8-32 characters
- **Character Options**:
  - Uppercase letters (A-Z)
  - Lowercase letters (a-z)
  - Numbers (0-9)
  - Special symbols (!@#$%^&*()_+{}[]<>?/|~)
- **One-Click Copy**: Copy generated passwords to clipboard
- **Responsive Design**: Works on desktop, tablet, and mobile
- **Modern UI**: Clean, intuitive interface with smooth animations

## 🛠️ Technology Stack

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

## 🚀 Deployment Architecture

```
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   User Browser  │───▶│   AWS EC2       │───▶│   Docker        │
│                 │    │   (eu-west-2)   │    │   Container     │
│                 │    │                 │    │   (Nginx)       │
└─────────────────┘    └─────────────────┘    └─────────────────┘
                              │
                              ▼
                       ┌─────────────────┐
                       │   Terraform     │
                       │   Infrastructure│
                       └─────────────────┘
```

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

## 📁 Project Structure

```
BAEproject/
├── index.html              # Main application file
├── Dockerfile              # Docker configuration
├── deploy.sh              # Local deployment script
├── README.md              # This file
└── infra/                 # Terraform infrastructure
    ├── main.tf            # Main Terraform configuration
    ├── variables.tf       # Variable definitions
    ├── user_data.sh       # EC2 boot script
    ├── terraform.tfvars.example
    └── README.md          # Infrastructure documentation
```

## 🔧 Configuration

### Environment Variables
- `AWS_REGION`: AWS region for deployment (default: eu-west-2)
- `INSTANCE_TYPE`: EC2 instance type (default: t2.micro)
- `KEY_PAIR_NAME`: SSH key pair for instance access

### Customization
- Modify `index.html` for UI changes
- Update `Dockerfile` for container configuration
- Adjust `infra/main.tf` for infrastructure changes

## 🌐 Live Demo

**Current Deployment**: [http://35.176.248.238](http://35.176.248.238)

*Note: This is a demo deployment and may be taken down periodically.*

## 📊 Performance

- **Load Time**: < 1 second
- **Bundle Size**: < 4KB (minimal dependencies)
- **Browser Support**: All modern browsers
- **Mobile Performance**: Optimized for mobile devices

## 🔒 Security Features

- **Client-side Generation**: Passwords generated in browser (no server storage)
- **Secure Random**: Uses cryptographically secure random number generation
- **No Data Collection**: No user data is stored or transmitted
- **HTTPS Ready**: Configured for secure connections

## 🧪 Testing

### Manual Testing
1. Generate passwords with different lengths
2. Test all character type combinations
3. Verify copy-to-clipboard functionality
4. Test responsive design on different screen sizes

### Browser Compatibility
- ✅ Chrome/Chromium
- ✅ Firefox
- ✅ Safari
- ✅ Edge

## 📈 Monitoring & Maintenance

### Health Checks
```bash
# SSH into the instance
ssh -i ~/.ssh/your-key.pem ec2-user@<public-ip>

# Check application status
docker ps
docker logs bae-project-app
./health_check.sh
```

### Logs
- Application logs: `docker logs bae-project-app`
- Deployment logs: `/var/log/app-deployment.log`
- System logs: `journalctl -u docker`

## 🗑️ Cleanup

To avoid AWS charges, destroy the infrastructure:
```bash
cd infra
terraform destroy
```

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test thoroughly
5. Submit a pull request

## 📄 License

This project is open source and available under the [MIT License](LICENSE).

## 🙏 Acknowledgments

- Built for learning and demonstration purposes
- Inspired by the need for secure password generation
- Uses modern web standards and best practices

---

**Built with ❤️ using modern web technologies and cloud infrastructure**
