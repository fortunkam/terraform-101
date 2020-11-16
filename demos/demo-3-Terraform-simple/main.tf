provider "random"{
    version = "~>2.2"
}

  
resource "random_pet" "pet" {
  length = 3
  prefix = "mf"
}

output "pet_name" {
    value = random_pet.pet.id
}
