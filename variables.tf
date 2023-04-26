variable "aws_region" {
	description = "Região que o cluster será criado"
}

variable "engine" {
	description = "Engine que será utilizada"
}

variable "db_name" {
	description = "Nome da base de dados"
}

variable "db_username" {
	description = "Nome do usuario que irá logar na base de dados"
}

variable "db_password" {
	description = "Senha do usuario para logar na base de dados"
}