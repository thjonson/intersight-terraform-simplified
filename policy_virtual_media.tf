variable "httpiso" {
  type = object({
    url      = string
    username = string
    password = string
  })
  default = {
    # url should be in the format of https://host.domain.com/path/file.iso with EITHER http or https 
    url      = "https://host.local/path/file.iso"
    username = ""
    password = ""
  }
}

resource "intersight_vmedia_policy" "vmedia_http_iso" {
  name = "vmedia_iso"
  tags = [local.terraform]
  organization {
    moid = local.organization
  }

  enabled       = false
  encryption    = true
  low_power_usb = true


}
