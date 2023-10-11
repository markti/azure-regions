output "all_regions" {
  value = local.has_3_zones
}

locals {
  zone_mappings = [for x in jsondecode(data.azapi_resource_action.regions.output).resourceTypes : x if x.resourceType == "virtualMachines"][0].zoneMappings
  has_3_zones   = [for x in local.zone_mappings : x.location if length(x.zones) == 3]
}