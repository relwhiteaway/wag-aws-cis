resource "aws_budgets_budget" "main_budget" {
  name         = "main-budget"
  budget_type  = "COST"
  limit_amount = var.limit_amount
  limit_unit   = "USD"
  time_unit    = "MONTHLY"

  notification {
    comparison_operator        = "GREATER_THAN"
    threshold                  = 100
    threshold_type             = "PERCENTAGE"
    notification_type          = "FORECASTED"
    subscriber_email_addresses = ["platform-squad-aaaacufkrk33nyd5ss27eul5zq@whiteaway.slack.com"]
  }
}
