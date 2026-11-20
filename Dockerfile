# Custom xray image for Upsun: stock xray-core + our config.json baked in.
# Required because Upsun Docker image apps run the image exactly as-is and
# never see the project repo (no Dockerfile build, no mounts of repo files).
# NO RUN instructions: the base image has no /bin/sh (proven on Cloady).
FROM ghcr.io/xtls/xray-core:latest
WORKDIR /etc/xray
COPY config.json ./config.json
EXPOSE 8080
ENTRYPOINT ["xray", "run", "-c", "/etc/xray/config.json"]
