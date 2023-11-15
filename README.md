docker build --no-cache -t lumidora-stable-diffusion-webui .

docker run --gpus all -p 7860:7860 -v lumidora-stable-diffusion-webui-outputs:/app/stable-diffusion-webui/outputs -v lumidora-stable-diffusion-webui-results:/app/stable-diffusion-webui/results lumidora-stable-diffusion-webui

docker exec -it [container id] /bin/bash


\\wsl.localhost\docker-desktop-data\data\docker\volumes\lumidora-stable-diffusion-webui\_data



ISSUE SadTalker Extension
: https://github.com/OpenTalker/SadTalker/issues/682

