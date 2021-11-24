# TAG=$(git rev-parse --short HEAD) docker buildx bake
# https://docs.docker.com/engine/reference/commandline/buildx_bake

variable "FLAG" {
  default = "dev"
}

target "x86_64-ubuntu-18.04" {
  context = "."
  dockerfile = "Containerfile"
  tags = [
    "docker.io/containercraft/ubuntu:18.04-${FLAG}",
    "docker.io/containercraft/ubuntu:bionic-${FLAG}"
  ]
  platforms = ["linux/amd64"]
  args = {
    ARCH = "amd64",
    FLAVOR = "ubuntu",
    VERSION = "18.04",
    RELEASE = "bionic",
    DOWNLOAD_URL = "https://cloud-images.ubuntu.com/bionic/current/bionic-server-cloudimg-amd64.img",
    PKG_APT = "screenfetch,python3,tmux,git,vim,net-tools,cloud-init,cloud-initramfs-growroot,qemu-guest-agent",
  }
}
