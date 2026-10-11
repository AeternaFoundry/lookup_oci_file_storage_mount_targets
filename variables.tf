variable "file_storage_mount_targets_lookup" {
  description = <<EOT
Map of file_storage_mount_targets_lookup, attributes below
Required:
    - availability_domain
    - compartment_id
Optional:
    - display_name
    - export_set_id
    - state
    - filter (block):
        - name (required)
        - regex (optional)
        - values (required)
EOT

  type = map(object({
    availability_domain = string
    compartment_id      = string
    display_name        = optional(string)
    export_set_id       = optional(string)
    state               = optional(string)
    filter = optional(list(object({
      name   = string
      regex  = optional(bool)
      values = list(string)
    })))
  }))
}

