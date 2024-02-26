# install docker and docker-compose plugin script
# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update

# Install the Docker packages: 
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# start docker service and enable docker as log in
sudo systemctl enable --now docker.service
sudo systemctl enable --now containerd.service

# Verify that the Docker Engine installation is successful by running the hello-world image.
if sudo docker run --rm hello-world 2>/dev/null | grep -q "Hello from Docker!"; then
    if docker-compose version 2>/dev/null | grep -q "docker-compose version"; then
        # check existence of the group named "docker"
        if ! getent group docker > /dev/null; then
            # create the docker group
            sudo groupadd docker
        fi
        # Add current user to the docker group
        sudo usermod -aG docker $USER
        echo "You might need to log out and log back in or restart your system to make group changes effective."
        echo "After that, you can verify that you can run docker commands without sudo."
    else
        echo "Docker installed successfully! Docker Compose does not!"
        echo "Check Docker Compose installation docs: https://docs.docker.com/compose/install/"
    fi
else
    echo "Docker installation failed!"
    echo "Check Docker installation docs: https://docs.docker.com/engine/install/ubuntu/#install-using-the-repository"
fi