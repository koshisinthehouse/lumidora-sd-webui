# Neues image bauen

docker build -t lumidora-sd-webui .


# useful build options if something went wrong
    --no-cache
    --log-level trace

# Docker container starten

docker run --gpus all -d -p 7860:7860 -v lumidora-sd-webui-models:/app/stable-diffusion-webui/models -v lumidora-sd-webui-extensions-sadtalker:/app/stable-diffusion-webui/extensions/SadTalker lumidora-sd-webui

# Docker container mit shell terminal öffnen

docker exec -it [container id] /bin/bash

# Aktuelle ISSUES

https://github.com/OpenTalker/SadTalker/issues/682

# Volumen Windows
    \\wsl.localhost\docker-desktop-data\data\docker\volumes\lumidora-sd-webui\_data




#RUN pip3 install gfpgan
#RUN pip3 install realesrgan
#RUN pip3 install pytorch-lightning
#RUN pip3 install triton


RUN ["chmod", "+x", "/app/stable-diffusion-webui/webui.sh"]
#RUN ./webui.sh -f --listen --api --no-half-vae --enable-insecure-extension-access --no-download-sd-model

#ENV VENV_DIR=-
#ARG VENV_DIR=-
#RUN ./webui.sh -f --no-download-sd-model  VENV_DIR=-

#RUN pip3 install xformers
#RUN python -m xformers.info output
#RUN pip3 install torch==2.0.1

#RUN python ./launch.py --skip-torch-cuda-test --no-download-sd-model


#RUN wget -P /usr/local/share/ca-certificates/cacert.org http://www.cacert.org/certs/root.crt http://www.cacert.org/certs/class3.crt
#RUN update-ca-certificates

#RUN  ./webui.sh -f --listen --api --no-half-vae --enable-insecure-extension-access --no-download-sd-model

#RUN . venv/bin/activate && pip3 install -r requirements.txt && ./webui.sh -f --listen --api --no-half-vae --enable-insecure-extension-access --no-download-sd-model

#RUN python launch.py --skip-torch-cuda-test
#RUN ./webui.sh -f --listen --api --no-half-vae --enable-insecure-extension-access --no-download-sd-model

#RUN ["chmod", "+x", "/app/stable-diffusion-webui/webui-user.sh"]
#CMD ./webui-user.sh -f --listen --api --no-half-vae --enable-insecure-extension-access --no-download-sd-model


#CMD ./webui.sh -f --listen --api --no-half-vae --enable-insecure-extension-access --no-download-sd-model
#RUN ["chmod", "+x", "/app/stable-diffusion-webui/venv/bin/activate"]
#CMD source venv/bin/activate 
#&& ./webui.sh -f --listen --api --no-half-vae --enable-insecure-extension-access --no-download-sd-model
CMD ["tail", "-f", "/dev/null"]




#CMD python --version
#CMD python launch.py
#CMD python -u webui.py --listen --api --no-half-vae --enable-insecure-extension-access --no-download-sd-model

#CMD ./python launch.py --precision full --no-half -f --listen --api --no-half-vae --enable-insecure-extension-access --no-download-sd-model

