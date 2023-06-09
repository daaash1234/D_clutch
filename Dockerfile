FROM ubuntu:22.04
# install pacages
RUN apt-get update && apt-get -y upgrade && apt-get install -y wget nmap iproute2 iputils-ping git dirb python3 python3-pip  build-essential zlib1g-dev

# install dirsearch
RUN git clone https://github.com/maurosoria/dirsearch.git /opt/dirsearch
RUN pip3 install -r /opt/dirsearch/requirements.txt
WORKDIR  /opt/dirsearch
RUN python3 /opt/dirsearch/setup.py install

# make sslscan
RUN git clone https://github.com/rbsec/sslscan.git /opt/sslscan
RUN cd /opt/sslscan && make static

# download code 
RUN git clone https://github.com/danielmiessler/SecLists.git /opt/SecLists
RUN git clone https://github.com/sullo/nikto.git /opt/nikto

RUN cd /tmp/ && mkdir mnt_host