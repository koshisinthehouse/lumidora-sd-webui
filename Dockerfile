FROM nvidia/cuda:12.3.1-runtime-ubuntu22.04
ENV DEBIAN_FRONTEND=noninteractive

RUN apt update -y
RUN apt upgrade -y
RUN apt install wget -y
RUN apt install git -y
RUN apt install python3 -y
RUN apt install python3-venv -y
RUN apt install python3-pip -y
RUN apt install python-is-python3 -y
RUN apt install ffmpeg -y
RUN apt install libtcmalloc-minimal4 -y

WORKDIR /app

# clone current sd automatic 1111 repo - START
RUN git clone https://github.com/AUTOMATIC1111/stable-diffusion-webui
# clone current sd automatic 1111 repo - END

WORKDIR /app/stable-diffusion-webui/

# install sd extensions - START
RUN git clone https://github.com/Winfredy/SadTalker ./extensions/SadTalker
RUN git clone https://github.com/AlUlkesh/stable-diffusion-webui-images-browser ./extensions/stable-diffusion-webui-images-browser
RUN git clone -b v2.0 https://github.com/camenduru/sd-civitai-browser ./extensions/sd-civitai-browser
RUN git clone https://github.com/Mikubill/sd-webui-controlnet ./extensions/sd-webui-controlnet
RUN git clone https://github.com/camenduru/openpose-editor ./extensions/openpose-editor
RUN git clone https://github.com/AUTOMATIC1111/stable-diffusion-webui-rembg ./extensions/stable-diffusion-webui-rembg
RUN git clone https://github.com/numz/sd-wav2lip-uhq ./extensions/sd-wav2lip-uhq
# install sd extensions - END


RUN wget -P /usr/local/share/ca-certificates/cacert.org http://www.cacert.org/certs/root.crt http://www.cacert.org/certs/class3.crt
RUN update-ca-certificates

# initial setup sd - START
RUN python3 -m venv venv
RUN . venv/bin/activate
RUN ./webui.sh -f --skip-torch-cuda-test --precision full --no-half --no-download-sd-model --exit
# fix error: 
RUN pip install torch==1.13.1+cu117 torchvision==0.14.1+cu117 torchtext==0.14.1 torchaudio==0.13.1 torchdata==0.5.1 --extra-index-url https://download.pytorch.org/whl/cu117
# initial setup sd - END

CMD . venv/bin/activate && ./webui.sh -f --listen --api --no-half-vae --enable-insecure-extension-access --no-download-sd-model
EXPOSE 7860


