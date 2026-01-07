group "default" {
  targets = ["amd64", "arm32v7", "arm64"]
}

variable "IMAGE_NAME" {
  default = "your-username/your-repo"
}

target "amd64" {
  dockerfile = "Dockerfile"
  platforms = ["linux/amd64"]
  tags = ["${IMAGE_NAME}:amd64-latest", "${IMAGE_NAME}:latest"]
}

target "arm32v7" {
  dockerfile = "Dockerfile.armhf"
  platforms = ["linux/arm/v7"]
  tags = ["${IMAGE_NAME}:arm32v7-latest"]
}

target "arm64" {
  dockerfile = "Dockerfile.aarch64"
  platforms = ["linux/arm64"]
  tags = ["${IMAGE_NAME}:arm64v8-latest"]
}
