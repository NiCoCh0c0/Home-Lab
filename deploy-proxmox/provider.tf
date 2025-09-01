# Documentation : https://registry.terraform.io/providers/Telmate/proxmox/latest/docs
provider "proxmox" {
    # Proxmox server parameters
    pm_api_url = "https://192.168.X.X:8006/api2/json"
    pm_user = "root"
    pm_password = "azertyuiop"
    pm_tls_insecure = true 

    # Enable logs for debugging
    pm_debug = true
    pm_log_enable = true
}