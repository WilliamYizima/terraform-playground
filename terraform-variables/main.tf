resource "local_file" "foo" {
  content  = var.conteudo
  filename = "./foobar.txt"
}

resource "local_file" "foo_file" {
  content  = "minha primeira fruta: ${var.conteudo_list[0]}"
  filename = "./foobar02.txt"
}

resource "local_file" "foo_file_map" {
  content  = "minha primeira fruta: ${var.conteudo_map["first_vm"]}"
  filename = "./foobarMap.txt"
}

resource "local_file" "foo_file_tuple" {
  content  = "My tuple: ${var.conteudo_tuple[0]}, ${var.conteudo_tuple[1]}, ${var.conteudo_tuple[2]}"
  filename = "./foobarTuple.txt"
}

resource "local_file" "foo_file_set" {
  content  = "minhas máquinas: ${join(",", var.conteudo_set)}"
  filename = "./foobarSet.txt"
}


resource "local_file" "foo_file_object" {
  content  = "My config Machine: ${var.conteudo_object["region"]}, ${var.conteudo_object["instance_type"]}, ${var.conteudo_object["ami"]}, ${var.conteudo_object["instance_number"]} and is production? ${var.conteudo_object["is_production"]}"
  filename = "./foobarObject.txt"
}
variable "conteudo" {
  default     = "conteudo foo!"
  type        = string
  description = "content value"
}

variable "conteudo_number" {
  default     = 1112
  type        = number
  description = "content value number"
}

variable "conteudo_bool" {
  default     = false
  type        = bool
  description = "content value number"
}

variable "conteudo_list" {
  default     = ["apple", "banana", "orange"]
  type        = list(string)
  description = "content value list"
}

variable "conteudo_map" {
  default     = { "first_vm" : "s001-g001", "second_vm" : "s002-g002", "third_vm" : "s003-g003" }
  type        = map(string)
  description = "content value map"
}

variable "conteudo_set" {
  default     = ["s001-g001", "s002-g002", "s003-g003"]
  type        = set(string)
  description = "content value set"
}

variable "conteudo_object" {
  default = { "region" : "us-east-1", "instance_type" : "t2.micro", "ami" : "ami-0c55b159cbfafe1f0", instance_number = 1, is_production = false }
  type = object({
    region = string, instance_type = string, ami = string, instance_number = number, is_production = bool
  })
  description = "content value set"
}

variable "conteudo_tuple" {
  default     = ["s001-g001", "s002-g002", true]
  type        = tuple([string, string, bool])
  description = "content value tuple"
}
