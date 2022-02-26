data "intersight_compute_rack_unit" "server" {
  serial = var.serial
}

resource "intersight_server_profile" "example-standalone" {
  name = "example-standalone"
  tags = [local.terraform]
    #action = "No-op"
  action = "Deploy"
  assigned_server {
    moid = data.intersight_compute_rack_unit.server.results[0].moid
    object_type = "compute.RackUnit"
  }

  organization {
    moid = local.organization
  }

  target_platform   = "Standalone"

  ### 
  ### Compute Configuration
  ###
  policy_bucket { # BIOS
    moid        = intersight_bios_policy.performance.moid
    object_type = intersight_bios_policy.performance.object_type
  }

  policy_bucket { # Boot Order
    moid        = intersight_boot_precision_policy.UEFI_m2_RAID.moid
    object_type = intersight_boot_precision_policy.UEFI_m2_RAID.object_type
  }

  policy_bucket { # Persistent Memory
    moid        = intersight_memory_persistent_memory_policy.configured_from_os.moid
    object_type = intersight_memory_persistent_memory_policy.configured_from_os.object_type
  }

  policy_bucket { # Virtual Media
    moid        = intersight_vmedia_policy.vmedia_http_iso.moid
    object_type = intersight_vmedia_policy.vmedia_http_iso.object_type
  }

  ###
  ### Management Configuration
  ###
  #   policy_bucket { # Certificate Management
  #     moid        = ""
  #     object_type = ""
  #   }

  policy_bucket { # Device Connector
    moid        = intersight_deviceconnector_policy.local_config_allowed.moid
    object_type = intersight_deviceconnector_policy.local_config_allowed.object_type
  }

  policy_bucket { # IPMI Over LAN
    moid        = intersight_ipmioverlan_policy.disabled.moid
    object_type = intersight_ipmioverlan_policy.disabled.object_type
  }


  #   policy_bucket { # Network Connectivity
  #     moid        = ""
  #     object_type = ""
  #   }

  #   policy_bucket { # NTP Policy
  #     moid        = intersight_ntp_policy.us_ntp["us_eastern"].moid
  #     object_type = intersight_ntp_policy.us_ntp["us_eastern"].object_type
  #   }

  policy_bucket { #Serial Over LAN
    moid        = intersight_sol_policy.disabled.moid
    object_type = intersight_sol_policy.disabled.object_type
  }

    policy_bucket { # SMTP
      moid        = intersight_smtp_policy.disabled.moid
      object_type = intersight_smtp_policy.disabled.object_type
    }

    policy_bucket { # SSH
      moid        = intersight_ssh_policy.disabled.moid
      object_type = intersight_ssh_policy.disabled.object_type
    }

  policy_bucket { # Virtual KVM
    moid        = intersight_kvm_policy.default.moid
    object_type = intersight_kvm_policy.default.object_type
  }

  ###
  ### Storage Configuration
  ###
  #   policy_bucket { # SD Card
  #     moid        = ""
  #     object_type = ""
  #   }

  policy_bucket { # Storage
    moid        = intersight_storage_storage_policy.m2_RAID1.moid
    object_type = intersight_storage_storage_policy.m2_RAID1.object_type
  }

  ###
  ### Network Configuration
  ###
    policy_bucket { # Adapter Configuration
      moid        = intersight_adapter_config_policy.mlom_no_pc.moid
      object_type = intersight_adapter_config_policy.mlom_no_pc.object_type
    }

  policy_bucket { # LAN Connectivity
    moid        = intersight_vnic_lan_connectivity_policy.esxi.moid
    object_type = intersight_vnic_lan_connectivity_policy.esxi.object_type
  }

  policy_bucket { #SAN Connectivity
    moid        = intersight_vnic_san_connectivity_policy.esxi.moid
    object_type = intersight_vnic_san_connectivity_policy.esxi.object_type
  }
}
