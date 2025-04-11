# Complete DevOps CI/CD Pipeline Project

## Overview

This project demonstrates a full DevOps pipeline using several popular tools to automate the process of building, testing, and deploying a web application. The solution is designed to integrate a range of DevOps practices, including Continuous Integration (CI), Continuous Delivery (CD), Infrastructure as Code (IaC), monitoring, and automation.

This project leverages **Docker**, **Kubernetes**, **Helm**, **Terraform**, **Jenkins**, **SonarQube**, **Prometheus**, and **Grafana** to build a fully automated pipeline that deploys a web application.

---

## Tools Used

- **Docker**: Used to containerize the web application, ensuring consistency across environments.
- **Kubernetes**: Manages the containerized applications for scalable and resilient deployments.
- **Helm**: Simplifies the deployment and management of applications in Kubernetes.
- **Terraform**: Automates infrastructure provisioning and management using Infrastructure as Code (IaC).
- **Jenkins**: Used to automate the CI/CD pipeline for building, testing, and deploying the web application.
- **SonarQube**: Used for continuous inspection of code quality and identifying bugs, vulnerabilities, and code smells.
- **Prometheus**: Collects and stores metrics for monitoring the application and infrastructure.
- **Grafana**: Provides visualization and monitoring dashboards for metrics collected by Prometheus.

---

## Project Structure

![image](https://github.com/user-attachments/assets/13d60d52-6319-4c55-a819-3b8ee5029ba1)



Complete-CICD-DevOps-Project-Pipeline/
├── Jenkins-SonarQube/
│   ├── main.tf            # Terraform configuration for Jenkins and SonarQube instances
│   ├── provider.tf        # AWS provider setup for Terraform
│   └── install.sh         # Script to install Jenkins and SonarQube
├── Monitoring-server/
│   ├── main.tf            # Terraform configuration for Prometheus and Grafana instances
│   ├── provider.tf        # AWS provider setup for Terraform
│   └── install.sh         # Script to install Prometheus and Grafana
├── kubernetes/
│   ├── helm/              # Helm charts for deploying the frontend app
│   │   └── frontend/      # Helm chart for frontend deployment
│   ├── manifests/         # Kubernetes YAML files for deploying the app
│   │   ├── frontend.yaml  # Frontend deployment and service
│   │   ├── backend.yaml   # Backend deployment and service
│   │   └── monitoring.yaml # Prometheus and Grafana services
│   └── kubernetes.yaml    # Kubernetes configuration for the project
└── Jenkinsfile            # Jenkins pipeline configuration file for CI/CD



