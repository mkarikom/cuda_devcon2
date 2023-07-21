FROM nvidia/cuda:11.4.2-base-ubuntu22.04

# This will make sure the commands run as the `root` user
USER root

# Update the system and install necessary components
RUN apt-get update && apt-get install -y \
    dirmngr \
    apt-transport-https \
    ca-certificates \
    software-properties-common \
    gnupg2

# Add the CRAN repository to get specific R version
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9
RUN add-apt-repository 'deb https://cloud.r-project.org/bin/linux/ubuntu focal-cran40/'

# Install specific R version
RUN apt-get update && apt-get install -y r-base=4.2.2-1.2004.0

# Set a working directory
WORKDIR /workspace

# Add metadata to the image to describe that the container is used for
LABEL description="A container with Ubuntu 22.04, CUDA support, and R 4.2.2"

