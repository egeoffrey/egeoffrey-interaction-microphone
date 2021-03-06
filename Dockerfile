### EGEOFFREY ###

### define base image
ARG SDK_VERSION
ARG ARCHITECTURE
FROM egeoffrey/egeoffrey-sdk-raspbian:${SDK_VERSION}-${ARCHITECTURE}

### install module's dependencies
RUN apt-get update && apt-get install -y flac alsa-utils pocketsphinx sox pulseaudio && apt-get clean && rm -rf /var/lib/apt/lists/*
RUN pip install SpeechRecognition

### copy files into the image
COPY . $WORKDIR
