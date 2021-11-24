# https://docs.docker.com/engine/reference/commandline/buildx_bake
# FLAG=$(git rev-parse --short HEAD) docker buildx bake --file ubuntu/bake.hcl

variable "FLAG" {
  default = "dev"
}

group "default" {
  targets = ["18.04", "20.04", "21.10"]
}

target "defaults" {
  dockerfile = "Containerfile"
  platforms = ["linux/amd64"]
  args = {
    FLAVOR = "ubuntu",
  }
}

target "18.04" {
  inherits = ["defaults"]
  tags = [
    "docker.io/containercraft/ubuntu:18.04-${FLAG}",
    "docker.io/containercraft/ubuntu:bionic-${FLAG}"
  ]
  args = {
    DOWNLOAD_URL = "https://cloud-images.ubuntu.com/bionic/current/bionic-server-cloudimg-amd64.img",
  }
}

target "20.04" {
  inherits = ["defaults"]
  tags = [
    "docker.io/containercraft/ubuntu:20.04-${FLAG}",
    "docker.io/containercraft/ubuntu:focal-${FLAG}"
  ]
  args = {
    DOWNLOAD_URL = "https://cloud-images.ubuntu.com/focal/current/focal-server-cloudimg-amd64.img",
  }
}

target "21.10" {
  inherits = ["defaults"]
  tags = [
    "docker.io/containercraft/ubuntu:21.10-${FLAG}",
    "docker.io/containercraft/ubuntu:impish-${FLAG}"
  ]
  args = {
    DOWNLOAD_URL = "https://cloud-images.ubuntu.com/impish/current/impish-server-cloudimg-amd64-disk-kvm.img",
  }
}
