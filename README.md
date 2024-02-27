# Package-Install-Shortcut-Script
Common packages and services install shutcut scripts

_**Caution: Review every lines of commands in the scripts before you run!**_

## Ubuntu
-   [docker](/Ubuntu/docker_install.sh):
    - official installation guide on docker docs: https://docs.docker.com/engine/install/
    - verified on verison: Ubuntu LTS 22.04 x64
    - include: docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
    - feature: 
        - install both docker main service and docker-compose plugin
        - test installation output result
        - auto add current user to docker group to run docker command without sudo
    - Kind reminder:
    For Nvidia gpu users, if you wan to run docker container with Nvidia gpu, install docker and docker-compose using this script. Because [nvidia-container-toolkit](https://github.com/NVIDIA/nvidia-container-toolkit) does not support docker desktop verison.
    Github issue: https://github.com/NVIDIA/nvidia-container-toolkit/issues/229#issuecomment-1903942016
    - shell script run command: 
    ```
    curl -s https://raw.githubusercontent.com/AllenCheng5186/Package-Install-Shortcut-Script/main/Ubuntu/ubuntu_docker_install.sh > ubuntu_docker_install.sh && bash ubuntu_docker_install.sh
    ```

## Arch
-   [docker](/Arch/arch_docker_install.sh):
    - Arch wiki docker topic: https://wiki.archlinux.org/title/docker
    - include: docker docker-compose
        - install both docker main service and docker-compose plugin
        - test installation output result
        - auto add current user to docker group to run docker command without sudo
    - Kind reminder:
    For Nvidia gpu users, if you wan to run docker container with Nvidia gpu, install docker and docker-compose using this script. Because [nvidia-container-toolkit](https://github.com/NVIDIA/nvidia-container-toolkit) does not support docker desktop verison.
    Github issue: https://github.com/NVIDIA/nvidia-container-toolkit/issues/229#issuecomment-1903942016
    - shell script run command: 
    ```
    curl -s https://raw.githubusercontent.com/AllenCheng5186/Package-Install-Shortcut-Script/main/Arch/arch_docker_install.sh > arch_docker_install.sh && bash arch_docker_install.sh
    ```
