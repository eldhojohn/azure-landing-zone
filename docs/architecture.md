# Azure Enterprise Landing Zone Architecture

## Overview

This repository implements a modular Azure Landing Zone using Terraform.

The platform provides secure, reusable infrastructure for hosting enterprise applications while separating shared platform resources from application-specific resources.

---

## High-Level Architecture

```text
Azure Subscription
│
├── Resource Groups
│   ├── rg-network-prod-aue-001
│   ├── rg-compute-prod-aue-001
│   ├── rg-security-prod-aue-001
│   └── rg-monitoring-prod-aue-001
│
├── Hub Virtual Network
│   ├── AzureBastionSubnet
│   ├── GatewaySubnet
│   ├── Management Subnet
│   └── Workload Subnet
│
├── Security
│   ├── Network Security Groups
│   ├── Route Tables
│   ├── Azure Key Vault
│   ├── Private Endpoints
│   └── Private DNS
│
├── Monitoring
│   ├── Log Analytics Workspace
│   └── Diagnostic Settings
│
└── Applications
    └── ROPES
```

---

## Resource Groups

| Resource Group | Purpose |
|----------------|---------|
| rg-network-prod-aue-001 | Networking resources |
| rg-compute-prod-aue-001 | Virtual machines |
| rg-security-prod-aue-001 | Key Vault and security |
| rg-monitoring-prod-aue-001 | Monitoring and diagnostics |

---

## Networking

The landing zone uses a hub virtual network.

Address Space

10.0.0.0/16

Subnets

- AzureBastionSubnet
- GatewaySubnet
- Management
- Workload

---

## Connectivity

Current connectivity includes:

- Azure Bastion
- Point-to-Site VPN Gateway
- Network Security Groups
- Route Tables

Future enhancements:

- Site-to-Site VPN
- ExpressRoute

---

## Security

The platform follows Microsoft's identity-first approach.

Implemented:

- Azure RBAC
- Azure Key Vault
- Private Endpoints
- Private DNS
- No public Key Vault access
- Centralised secrets management

Future:

- Managed Identities
- Azure Policy
- Defender for Cloud

---

## Monitoring

Monitoring services include:

- Log Analytics Workspace
- Diagnostic Settings
- Centralised platform logging

Future:

- Application Insights
- Azure Monitor Alerts

---

## Platform vs Application

The repository separates shared infrastructure from applications.

### Platform

```
environments/prod
```

Contains:

- Networking
- Security
- Monitoring
- Shared services

### Application

```
applications/ropes/prod
```

Contains:

- IIS
- Storage
- SQL
- Managed Identity
- Application monitoring

This separation allows applications to be deployed independently of the shared platform.

---

## Deployment Flow

```
Terraform

↓

Resource Groups

↓

Networking

↓

Security

↓

Monitoring

↓

Applications
```

---

## Design Principles

The landing zone has been designed using the following principles.

- Infrastructure as Code
- Modular Terraform
- Least privilege access
- Private networking
- Identity-first authentication
- Reusable modules
- Environment separation
- Independent Terraform state