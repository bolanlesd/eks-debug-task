# Terraform EKS Debugging Challenge (Raw AWS Resources)

## 🧠 Goal
Fix the broken Terraform configuration so that `terraform plan` runs successfully.

This test evaluates your ability to:
- Read and debug raw Terraform code
- Understand AWS EKS, IAM, and VPC integration
- Identify subtle logic and syntax issues

> 💡 You do **not** need to apply the resources — a successful `terraform plan` is the goal.

---

## 🧪 Setup
You’ve been provided with a minimal Terraform project made up of:

- `main.tf`: Contains VPC, Subnets, and EKS cluster
- `iam.tf`: IAM role + policy for the cluster
- `outputs.tf`: Attempts to output cluster details

The code **contains several bugs**, including:
- Syntax errors
- Incorrect attribute references
- Logic bugs in loops and indexing
- Undefined variables
- Version compatibility issues

---

## ✅ Your Task

1. Clone or unzip the Terraform files into your working directory.
2. Fix all the issues so that:
   - `terraform init` works without errors
   - `terraform validate` succeeds
   - `terraform plan` completes without failure
3. Add inline comments (`# FIXED:`) where you make corrections.

---

## ⏱️ Time Limit
**15 minutes** (this is meant to simulate a focused, real-world debug scenario).

---

## 📦 Files
You should see:
```
main.tf
iam.tf
outputs.tf
```

Good luck!
