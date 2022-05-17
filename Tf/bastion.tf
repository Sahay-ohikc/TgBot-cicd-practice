data "google_compute_address" "bastion-ip" {
  name         = "bastion-ip1"
}

resource "google_compute_instance" "bastion52" {
  name         = "bastion52"
  machine_type = "f1-micro"
  zone         = "us-east1-b"
  tags         = ["bastion", "public"]
  scheduling {
    preemptible       = true
    automatic_restart = false
  }
  boot_disk {
    initialize_params {
      image = "family/ubuntu-2004-lts"
    }
  }
  network_interface {
    subnetwork = google_compute_subnetwork.zone52-public.id
    access_config {
      network_tier = "STANDARD"
      nat_ip = data.google_compute_address.bastion-ip.address
    }
  }
  metadata = {
    ssh-keys = <<EOF
      okhab:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDAuYqOtAskIU8HZO012fwIgI3GG4hJgPV1z5P2KMaXXW+Y2crJcFT6l52jyYOjfCTf6cE0LSc+qqO/QJys+xfQG3zGA6wKnjw40mWbkia2DeA3FcApfnfFgC+q3+QJatRbk7ixpL10bVZkDg9WhV4aRwPsUxjBE7WTbcd01aW/xa1C5N59LGtXZ6Ep6jQXPmUXsWtey/9SUDVEin4isM3dxAhCF7zyUlPca57qMz3lFm0r48RlmtwY5RnF6SwM6sXPm33ZwdTkmdsUPk8G350KCWuaCs2eUVLHlfN6WfWuGXWVJDmYO8d4kzbaTagK/Z3xnRZfYRXiOIthylI9Rgx3JP+TE8RZgUOisQLbh20Bwf7VnSifd23jXQMSIN52DigTL0xp4PcTYpb1ahLm4jqwJBdtAzbsm5uNJUSFnfDz6IEgFeGdNbS1CPh2jpKImo8JSW1YjKVIvs95ZYBAES3PT93A2JTIb3ybg9ByDrnN5+a03PPfKmwMxDFo3V/q1c8= okhab@5CD116MKPZ
      idksomename:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDMCNj/i3yAm1YZly2Ev42ZrAFXtN9RgaqCUjUFZHXnZ3o8N9VzdTk9Ho60/L0TdSfR/NVoUYZfkr8kOljCJAumIRJ9bYF0m7y252B+SoBFOR1IPOUAK2rdwYHzNhtsk8V4GZYz2qMYWe/maVKxvcMADPTus7Rn9SsZFQPoKY4zq/5QbvHZ1x3cWTPke+x9uStxybXqg98rmy68k68BIfDAqw/I5/aLt3n/Az18KSsrDN3cDgPYX+VqfaG/rVmjwbmi3K5XP8ZXootNjWOtJM2vZs+0xzafletpQ/6zUY9nbuRSpKdHVVFWKrHxjzP9a3iNijBAqke6j4Ev5XI0rHVMOCsKbKOLBZcnESh7ujpYKZWgwpDK8nz2Mv2XA5NgXKHsNIHqIUXkINlDFYvQbcfKJ6k1qDT0cKWyI520g5kKTuq3v3dO5xrC9tfFltDjmEE0KTWqoI6EAvgnvEBfPqaoD1il4rXUwS3VVA+7Tu7U8N4q8cvVjH7ssMES7t20UGU= idksomename@idksomename-Lenovo-ideapad-330
    EOF
  }
  metadata_startup_script = "sudo apt-get install -y netcat | sudo sed -i 's/#Port 22/Port 7000/' /etc/ssh/sshd_config | sudo systemctl restart sshd"
}


