terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  required_version = ">= 1.6"
}


provider "aws" {
  region = "us-east-1"
}


# ── GitHub Actions OIDC provider ──────────────────────────────────────────────
# Registered once per AWS account. Allows GitHub to present short-lived JWT tokens
# that AWS STS can verify without any stored access keys.

resource "aws_iam_openid_connect_provider" "github" {
  url = "https://token.actions.githubusercontent.com"

  client_id_list = ["sts.amazonaws.com"]

  # SHA-1 thumbprint of the GitHub OIDC TLS certificate (stable).
  # Verified at: https://docs.github.com/en/actions/security-guides/security-hardening-with-openid-connect
  thumbprint_list = ["6938fd4d98bab03faadb97b34396831e3780aea1"]

}