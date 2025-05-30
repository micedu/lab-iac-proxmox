variable "containers" {
  type = list(object({
    hostname = string
    cores = number
    memory = number
    ip = string
  }))
}
