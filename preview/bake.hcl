# https://docs.docker.com/engine/reference/commandline/buildx_bake
# FLAG=$(git rev-parse --short HEAD) docker buildx bake --file preview/bake.hcl

variable "FLAG" {
  default = "dev"
}

group "default" {
  targets = ["ubuntu-20.04"]
}

group "ubuntu" {
  targets = ["ubuntu-18.04", "ubuntu-20.04", "ubuntu-21.10"]
}

group "fedora" {
  targets = ["fedora-34", "fedora-35"]
}

group "centos-stream" {
  targets = ["centos-stream-8", "centos-stream-9"]
}

target "ubuntu-defaults" {
  dockerfile = "preview/Containerfile"
  platforms = ["linux/arm64"]
  args = {
    FLAVOR = "ubuntu",
  }
}

target "fedora-defaults" {
  dockerfile = "preview/Containerfile"
  platforms = ["linux/amd64"]
  args = {
    FLAVOR = "fedora",
  }
}

target "centos-stream-defaults" {
  dockerfile = "preview/Containerfile"
  platforms = ["linux/amd64"]
  args = {
    FLAVOR = "centos-stream",
  }
}

target "ubuntu-18.04" {
  inherits = ["ubuntu-defaults"]
  tags = [
    "docker.io/containercraft/ubuntu:18.04-${FLAG}",
    "docker.io/containercraft/ubuntu:bionic-${FLAG}"
  ]
  args = {
    VERSION = "18.04"
  }
}

target "ubuntu-20.04" {
  inherits = ["ubuntu-defaults"]
  tags = [
    "docker.io/containercraft/ubuntu:20.04-${FLAG}",
    "docker.io/containercraft/ubuntu:focal-${FLAG}"
  ]
  args = {
    VERSION = "20.04"
  }
}

target "ubuntu-21.10" {
  inherits = ["ubuntu-defaults"]
  tags = [
    "docker.io/containercraft/ubuntu:21.10-${FLAG}",
    "docker.io/containercraft/ubuntu:impish-${FLAG}"
  ]
  args = {
    VERSION = "21.10"
  }
}

target "fedora-34" {
  inherits = ["fedora-defaults"]
  tags = [
    "docker.io/containercraft/fedora:34-${FLAG}",
  ]
  args = {
    VERSION = "34"
  }
}

target "fedora-35" {
  inherits = ["fedora-defaults"]
  tags = [
    "docker.io/containercraft/fedora:35-${FLAG}",
  ]
  args = {
    VERSION = "35"
  }
}

target "arch" {
  dockerfile = "preview/Containerfile"
  platforms = ["linux/amd64"]
  tags = [
    "docker.io/containercraft/arch:latest-${FLAG}",
  ]
  args = {
    FLAVOR = "arch"
    VERSION = "latest"
  }
}

target "centos-stream-8" {
  inherits = ["centos-stream-defaults"]
  tags = [
    "docker.io/containercraft/centos-stream:8-${FLAG}",
  ]
}

target "centos-stream-9" {
  inherits = ["centos-stream-defaults"]
  tags = [
    "docker.io/containercraft/centos-stream:9-${FLAG}",
  ]
}
