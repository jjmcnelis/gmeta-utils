FROM osgeo/gdal:ubuntu-full-latest
ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8

# Add Python3 and pip3.
RUN apt-get update && apt-get install -y \
    apt-utils \
    software-properties-common \
    python3-pip \
    python-pip \
    nco \
    --reinstall coreutils

# Add the ubuntugis repository.
RUN add-apt-repository ppa:ubuntugis/ppa

# Install high level GDAL/OGR interfaces.
RUN pip3 install rasterio fiona

# Copy xsv to /opt and link to /usr/bin.
COPY ./xsv /opt/xsv
RUN ln -s /opt/xsv /usr/bin/xsv

# # Copy nco bashrc insert to /tmp.
# COPY ./docs/bashtk.sh /tmp/bashtk.sh
# # Insert to .bashrc
# RUN cat /tmp/bashtk.sh >> ~/.bashrc

# Copy metadata script to /opt.
COPY ./gmeta /opt/gmeta
# Make executable.
RUN chmod +x /opt/gmeta
# Link to /usr/bin.
RUN ln -s /opt/gmeta /usr/bin/gmeta

# Data mount point.
VOLUME ["/data"]

# Set the working directory to the output folder.
WORKDIR /data

# ENTRYPOINT tells docker to run image as an application.
ENTRYPOINT ["gmeta"]
