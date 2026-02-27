resource "local_file" "metadata_example01" {
  content    = "first content"
  filename   = "./metadata_01.txt"
  depends_on = [local_file.metadata_example02]
}

resource "local_file" "metadata_example02" {
  content  = "second content ${count.index}"
  filename = "./metadata${count.index}.txt"
  count    = var.countA
}


resource "local_file" "metadata_example03" {
  content  = "third content ${each.key}"
  filename = "./metadata_each${each.key}.txt"
  for_each = var.foreach_contador
}

variable "countA" {
  type    = number
  default = 5
}

variable "foreach_contador" {
  default = ["Maquina01", "Maquina02", "Maquina03", "Maquina04", "Maquina05"]
  type    = set(string)
}
