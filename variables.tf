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