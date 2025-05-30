provider "proxmox" {
  pm_api_url = "https://your-proxmox:8006/api2/json"
  pm_user = "root@pam"
  pm_password = "your-password"
  pm_tls_insecure = true
}

resource "proxmox_lxc" "container" {
  count = length(var.containers)

  hostname = var.containers[count.index]["hostname"]
  ostemplate = "local:vztmpl/debian-12-standard_12.7-1_amd64.tar.zst"
  target_node = "proxmox"
  cores = var.containers[count.index]["cores"]
  memory = var.containers[count.index]["memory"]
  unprivileged = true
  network {
    name = "eth0"
    bridge = "vmbr0"
    ip = var.containers[count.index]["ip"]
  }
}
