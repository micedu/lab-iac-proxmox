
terraform {
  required_providers {
    proxmox = {
      source  = "telmate/proxmox"
      version = "~> 2.9.11"
    }
  }
}

provider "proxmox" {
  pm_api_url      = "https://192.168.100.10:8006/api2/json"
  pm_user         = "root@pam"
  pm_password     = "tu_clave_aqui"
  pm_tls_insecure = true
}
