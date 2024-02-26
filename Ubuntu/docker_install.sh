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
if sudo docker run --rm hello-world | grep -q "Hello from Docker!"; then
  if docker compose version | grep -q "Docker Compose version"; then
    # add current user to docker group to run docker command without sudo
    # Create the docker group.
    sudo groupadd docker
    # Add your user to the docker group.
    sudo usermod -aG docker $USER
    # activate the changes to groups
    newgrp docker
    # Verify that you can run docker commands without sudo.
    docker run --rm hello-world
  else
    echo "Docker install successfully! Docker compose does not!"
    echo "check docker docs: https://docs.docker.com/compose/install/"
else
  echo "Docker install fail!"
  echo "check docker docs: "https://docs.docker.com/engine/install/ubuntu/#install-using-the-repository"