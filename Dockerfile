# Use the official Ubuntu 20.04 base image
FROM ubuntu:20.04

# Update package lists and install necessary packages
RUN apt-get update && \
    apt-get install -y \
    sudo \
    curl \
    git \
    libx11-xcb1 \
    libxcb-dri3-0 \
    libdrm2 \
    libgbm1 \
    libnss3 \
    libxss1 \
    libasound2 \
    libxtst6 \
    libgtk-3-0 \
    libxkbfile1 \
    libsecret-1-0 \
    libnotify4 \
    xdg-utils

# Install VSCode
RUN curl -sSL https://code.visualstudio.com/docs/?dv=linux64_deb -o vscode.deb && \
    sudo apt install ./vscode.deb && \
    rm vscode.deb

# Create a non-root user and switch to it
RUN useradd -ms /bin/bash vscodeuser
USER vscodeuser

# Set the working directory
WORKDIR /home/vscodeuser

# Start VSCode
CMD ["code", "--no-sandbox", "--disable-gpu"]
