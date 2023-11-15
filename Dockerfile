FROM nvidia/cuda:12.3.0-runtime-ubuntu22.04
ENV DEBIAN_FRONTEND=noninteractive

RUN apt update -y
RUN apt upgrade -y
RUN apt install wget -y
RUN apt install git -y
RUN apt install python3 -y
RUN apt install python3-venv -y
RUN apt install python3-pip -y
RUN apt install python-is-python3 -y
RUN apt install libgl1 -y
RUN apt install libglib2.0-0 -y
RUN apt install ffmpeg -y

RUN apt install libtcmalloc-minimal4 -y

WORKDIR /app

RUN wget -q https://raw.githubusercontent.com/AUTOMATIC1111/stable-diffusion-webui/master/webui.sh

RUN ["chmod", "+x", "/app/webui.sh"]
RUN /app/webui.sh -f

WORKDIR /app/stable-diffusion-webui/

# SadTalker - START
RUN pip3 install gfpgan
RUN pip3 install realesrgan
RUN git clone https://github.com/Winfredy/SadTalker ./extensions/SadTalker
# SadTalker - END

# extensions - START
RUN git clone https://github.com/AlUlkesh/stable-diffusion-webui-images-browser ./extensions/stable-diffusion-webui-images-browser
RUN git clone -b v2.0 https://github.com/camenduru/sd-civitai-browser ./extensions/sd-civitai-browser
RUN git clone https://github.com/Mikubill/sd-webui-controlnet ./extensions/sd-webui-controlnet
RUN git clone https://github.com/camenduru/openpose-editor ./extensions/openpose-editor
# extensions - END

RUN pip3 install xformers
RUN pip3 install triton
RUN python -m xformers.info output

CMD ./webui.sh -f --listen --api --no-half-vae --enable-insecure-extension-access --no-download-sd-model

EXPOSE 7860


