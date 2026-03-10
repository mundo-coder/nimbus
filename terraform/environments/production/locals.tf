locals {
  name_suffix = var.deployment_name

  # URLs for cross-service configuration
  control_plane_host = "${local.name_suffix}-control-plane.${var.cloudflare_worker_subdomain}.workers.dev"
  control_plane_url  = "https://${local.control_plane_host}"
  ws_url             = "wss://${local.control_plane_host}"

  # Web app URL — custom domain when set, otherwise workers.dev
  web_app_url = var.web_custom_domain != "" ? (
    "https://${var.web_custom_domain}"
    ) : var.web_platform == "cloudflare" ? (
    "https://${local.name_suffix}-web.${var.cloudflare_worker_subdomain}.workers.dev"
    ) : (
    "https://${local.name_suffix}.vercel.app"
  )

  # Worker script paths (deterministic output locations)
  control_plane_script_path = "${var.project_root}/packages/control-plane/dist/index.js"
  slack_bot_script_path     = "${var.project_root}/packages/slack-bot/dist/index.js"
  linear_bot_script_path    = "${var.project_root}/packages/linear-bot/dist/index.js"
  github_bot_script_path    = "${var.project_root}/packages/github-bot/dist/index.js"
}
