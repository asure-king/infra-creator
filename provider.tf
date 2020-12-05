provider "google" {
  credentials = "${file("./creds/asure-infra-creator.json")}"
  project = "asure-terraformar-273003"
  region = "us-central1"
  zone = "us-central1-a"
}