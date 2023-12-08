# Neues image bauen

docker build -t lumidora-sd-webui .


# useful build options if something went wrong
    --no-cache
    --log-level trace

# Docker container starten

docker run --gpus all -d -p 7860:7860 -v lumidora-sd-webui:/app/stable-diffusion-webui lumidora-sd-webui

# Docker container mit shell terminal öffnen

docker exec -it [container id] /bin/bash

# Aktuelle ISSUES

https://github.com/OpenTalker/SadTalker/issues/682

# Volumen Windows
    \\wsl.localhost\docker-desktop-data\data\docker\volumes\lumidora-sd-webui\_data

