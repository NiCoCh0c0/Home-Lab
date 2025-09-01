terraform {
    required_providers {
      proxmox = {
        source = "telmate/proxmox"
        version = "3.0.2-rc03"
      }
    }
}
# TO TRY : terraform import proxmox_vm_qemu.import_test mynode/qemu/106

# Documentation : https://registry.terraform.io/providers/Telmate/proxmox/latest/docs/resources/vm_qemu
resource "proxmox_vm_qemu" "first-terraform-deploy" {
    # Informations seen on proxmox
    name = "first-terraform-deploy"
    target_node = "autopve"
    description = "Description de la VM"

    protection = true
    agent = 1
    #clone_id = X
    #full_clone = false

    # Hardware detail
    cpu {
        cores = 2
    }
    memory = 2048
    disk {
        type = "disk"
        slot = "scsi0"
        size = "10G"
    }
    network {
        id = 0
        model = "virtio"
        bridge = "vmbr0"
    }
    #pool = "local-lvm"
    os_type = "ubuntu"

    skip_ipv6 = true
}