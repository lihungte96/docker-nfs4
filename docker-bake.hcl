variable "IMAGE_NAME" {
  default = "your-username/docker-nfs4"
}

# This group allows you to run all three targets with one command
group "default" {
  targets = ["amd64", "arm32v7", "arm64v8"]
}

target "amd64" {
  dockerfile = "Dockerfile"
  platforms  = ["linux/amd64"]
  args = {
    ARCH = "x86_64"
  }
  tags = ["${IMAGE_NAME}:amd64-latest"]
}

target "arm32v7" {
  dockerfile = "Dockerfile"
  platforms  = ["linux/arm/v7"]
  args = {
    ARCH = "armhf"
  }
  tags = ["${IMAGE_NAME}:arm32v7-latest"]
}

target "arm64v8" {
  dockerfile = "Dockerfile"
  platforms  = ["linux/arm64"]
  args = {
    ARCH = "aarch64"
  }
  tags = ["${IMAGE_NAME}:arm64v8-latest"]
}
