ARG debian_buster_image_tag=8u322-jdk-slim-buster
FROM openjdk:${debian_buster_image_tag}

ENV USER ds
ENV CONDA_DIR=/home/$USER/apps/miniconda3
ENV PATH=$CONDA_DIR/bin:$PATH

# # -- Layer: OS + Python 3.7
# # -- Arrow install reference : https://arrow.apache.org/install/

RUN apt-get update && \
    apt-get install -y wget && \
    apt-get install -y curl && \
    apt-get install -y cmake && \
    apt-get install -y make && \
    apt-get install -y gcc && \
    apt-get install -y gfortran && \
    apt-get install -y libjpeg-dev && \
    apt-get install -y libblas3 && \
    apt-get install -y liblapack3 && \
    apt-get install -y liblapack-dev && \
    apt-get install -y libblas-dev && \
    apt-get install -y libffi-dev && \
    apt-get install -y zlib1g-dev && \
    apt-get install -y -V ca-certificates lsb-release wget && \
    wget https://apache.jfrog.io/artifactory/arrow/$(lsb_release --id --short | tr 'A-Z' 'a-z')/apache-arrow-apt-source-latest-$(lsb_release --codename --short).deb && \
    apt-get install -y -V ./apache-arrow-apt-source-latest-$(lsb_release --codename --short).deb && \
    apt-get update -y && \
    apt-get install -y -V libarrow-dev && \
    apt-get install -y -V libarrow-glib-dev && \
    apt-get install -y -V libarrow-dataset-dev && \
    apt-get install -y -V libarrow-flight-dev && \
    apt-get install -y python3

# -- Layer : User
RUN echo "root:root" | chpasswd && \
    useradd -ms /bin/bash $USER

# Switch to $USER user
USER $USER

WORKDIR /tmp

# -- Layer : Conda
RUN mkdir /home/$USER/apps && \
    wget --quiet https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh && \
    chmod +x Miniconda3-latest-Linux-x86_64.sh && \
    sh Miniconda3-latest-Linux-x86_64.sh -b -p $CONDA_DIR && \
    rm Miniconda3-latest-Linux-x86_64.sh && \
    echo ". $CONDA_DIR/etc/profile.d/conda.sh" >> ~/.profile && \
    conda init bash && \
    conda update --name base --channel defaults conda

# -- Layer : Packages
RUN pip install --upgrade pip && \
    conda install arrow-cpp=7.0.* -c conda-forge && \
    conda install pyarrow=7.0.* -c conda-forge && \
    pip install numpy


# -- Runtime

CMD ["bash"]