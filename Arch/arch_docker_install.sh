# docker desktop conflict with systemctl runing docker
# install docker engine and docker compose plugin
pacman -S docker docker-compose

# start docker service and enable docker as log in
systemctl enable --now docker.service

# Verify that the Docker Engine installation is successful by running the hello-world image.
if sudo docker run --rm hello-world 2>/dev/null | grep -q "Hello from Docker!"; then
    if docker compose version 2>/dev/null | grep -q "Docker Compose version"; then
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
    echo "Check Arch Wiki: https://wiki.archlinux.org/title/docker"
fi