provider "docker" {
    host = "tcp://127.0.0.1:2375"
}

# Create a container
resource "docker_container" "jenkins" {
    image = "${docker_image.jenkins.latest}"
    name  = "jenkins2"
    volumes = {
        host_path      = "${path.cwd}/jenkins_home"
        container_path = "/var/jenkins_home"    
    }
    ports = [
        {
            internal = 50000
            external = 50000
        },
        {
            internal = 8080
            external = 8585
        }
    ]
}

resource "docker_image" "jenkins" {
  name = "jenkins:latest"
}