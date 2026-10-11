data "oci_file_storage_mount_targets" "file_storage_mount_targets_lookup" {
  for_each = var.file_storage_mount_targets_lookup

  availability_domain = each.value.availability_domain
  compartment_id      = each.value.compartment_id
  display_name        = each.value.display_name
  export_set_id       = each.value.export_set_id
  state               = each.value.state

  dynamic "filter" {
    for_each = each.value.filter != null ? each.value.filter : []
    content {
      name   = filter.value.name
      regex  = filter.value.regex
      values = filter.value.values
    }
  }
}

