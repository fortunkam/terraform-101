anatomy of a simple terraform script

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



provider -> resource -> output

plan -> state file (show state file, show changes)
apply -> run the plan
destroy -> remove resoures created by the plan

move resources to seperate file to show modules

toggle prefix on random to show resource regenerated (plan)

move output to seperate file to show no change to resource (plan).


