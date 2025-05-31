provider "proxmox" {
  pm_api_url = "https://192.168.100.10:8006/api2/json"
  pm_user    = "root@pam"
  pm_password = "your_password"
  pm_tls_insecure = true
}

resource "proxmox_lxc" "container" {
  count = 3
  hostname = ["web", "db", "monitor"][count.index]
  ostemplate = "local:vztmpl/debian-12-standard_12.7-1_amd64.tar.zst"
  target_node = "pve"
  vmid = 100 + count.index
  cores = 1
  memory = 512
  swap = 0
  unprivileged = true
  start = false
  tty = 2
  features = ""
  net0 = "name=eth0,ip=192.168.100.10${count.index + 1}/24,bridge=vmbr0"
}