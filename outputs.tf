output "db_password_secret_arn" {
  value = aws_secretsmanager_secret.db_password.arn
}

output "ci_runner_role_arn" {
  value = aws_iam_role.ci_runner.arn
}
