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
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# start docker service and enable docker as log in
sudo systemctl enable --now docker.service
sudo systemctl enable --now containerd.service

# Verify that the Docker Engine installation is successful by running the hello-world image.
sudo docker run -rm hello-world

if echo "$line" | grep -E "Hello from Docker!"; then
  echo "docker install successfully!"
else
  echo "docker install fail!"
fi

docker compose version

if echo "$line" | grep -E "Docker Compose version"; then
  echo "docker-compose install successfully!"
else
  echo "docker-compose install fail!"
fi
