# =============================================================================
# Cloudflare KV Namespaces
# =============================================================================

module "session_index_kv" {
  source = "../../modules/cloudflare-kv"

  account_id     = var.cloudflare_account_id
  namespace_name = "${local.name_suffix}-session-index"
}

module "slack_kv" {
  count  = var.enable_slack_bot ? 1 : 0
  source = "../../modules/cloudflare-kv"

  account_id     = var.cloudflare_account_id
  namespace_name = "${local.name_suffix}-slack-kv"
}

module "github_kv" {
  count  = var.enable_github_bot ? 1 : 0
  source = "../../modules/cloudflare-kv"

  account_id     = var.cloudflare_account_id
  namespace_name = "${local.name_suffix}-github-kv"
}

module "linear_kv" {
  count  = var.enable_linear_bot ? 1 : 0
  source = "../../modules/cloudflare-kv"

  account_id     = var.cloudflare_account_id
  namespace_name = "${local.name_suffix}-linear-kv"
}
