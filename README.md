# Package-Install-Script
Common packages and services install shutcut scripts

_**Caution: Review every lines of commands in the scripts before you run!**_

## Ubuntu
-   [docker](/Ubuntu/docker_install.sh):
    - verified on verison: Ubuntu LTS 22.04 x64
    - include: docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
    - feature: 
        - install both docker main service and docker-compose plugin
        - test installation output result
        - auto add current user to docker group to run docker command without sudo
    - shell script run command: 
    ```
    curl -s https://raw.githubusercontent.com/AllenCheng5186/Package-Install-Script/main/Ubuntu/docker_install.sh > ubuntu_docker.sh && bash ubuntu_docker.sh
    ```