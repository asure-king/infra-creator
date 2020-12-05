terraform {
    backend "gcs" {
        credentials = "./creds/asure-infra-creator.json"
        bucket = "asure-terraformar-273003-asure-pipeline"
        prefix = "asure-terraformar-273003-asure-pipeline-state"
    }
}