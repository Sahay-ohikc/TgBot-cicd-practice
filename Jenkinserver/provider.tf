provider "google" {
  project = "okhab-education-25433"
  region  = "us-east1"
  #credentials = file ("/home/sahay/dangerzone/restricted/firstwebaccess.json")
}

terraform {
  backend "gcs" {
    bucket         = "sahay-tfstate"
    prefix         = "tgbot/jenkinstate"
  }
}

