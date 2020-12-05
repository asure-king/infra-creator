variable "project-id" {
    default = "asure-terraformar-273003"
    type = string
}
variable "region" {
    default = "us-central1"
    type = string
}
variable "zone" {
    type = string
    default = "us-central1-a"
}
variable "vpc-name" {
    type = string
    default = "asure-vpc"
}
#variable "metadata-sv" {
    #type = list(string)
    #default =[sudo apt-get update -sudo apt-get install apache2 -y -sudo #service apache2 restart ] 
    
 #   " "#! /bin/bash 
    #sudo apt-get update
    #sudo apt-get install apache2 -y
    #sudo service apache2 restart
    #echo '<!doctype html><html><body><h1>www-1</h1></body></html>' | tee /#var/www/html/index.html
   # EOF"
  #  "
#}#
