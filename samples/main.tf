
module "regions" {
  source            = "../"
  resource_provider = "Microsoft.Compute"
}

resource "random_shuffle" "rando_region" {
  input        = module.regions.all_regions
  result_count = 2
}
output "my_regions" {
  value = random_shuffle.rando_region.result
}