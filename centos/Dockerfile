FROM centos:centos7.9.2009

ARG PYTHON_VERSION=3.10.7
ARG PYTHON_VERSION_LN=3.10

RUN mkdir -p /tmp/python-src/Python-$PYTHON_VERSION && mkdir /tmp/python
WORKDIR /tmp/python-src/Python-$PYTHON_VERSION
RUN yum check-update || true \
    && yum -y groupinstall "Development tools" \
    && yum -y install epel-release.noarch wget zlib-devel bzip2-devel openssl11-devel ncurses-devel libxml2-devel libxslt-devel readline-devel tk-devel \
    gdbm-devel db4-devel libpcap-devel xz-devel libjpeg-devel libssl-dev \
    && wget --no-check-certificate https://www.python.org/ftp/python/$PYTHON_VERSION/Python-$PYTHON_VERSION.tgz -O /tmp/python.tgz \
    && tar -zxvf /tmp/python.tgz -C /tmp/python-src \
    && sed -i 's/PKG_CONFIG openssl /PKG_CONFIG openssl11 /g' configure \
    && ./configure --prefix=/usr/local LDFLAGS="-Wl,-rpath /usr/local/lib" --with-ensurepip=install --enable-optimizations --with-lto \
    && make \
    && make altinstall \
    && rm -rf /tmp/python-src /tmp/python.tgz \
    && yum -y groupremove "Development tools" \
    && yum -y remove epel-release.noarch wget zlib-devel bzip2-devel openssl11-devel ncurses-devel libxml2-devel libxslt-devel readline-devel tk-devel \
    gdbm-devel db4-devel libpcap-devel xz-devel libjpeg-devel libssl-dev \
    && yum clean all \
    && ln -s /usr/local/bin/python$PYTHON_VERSION_LN /usr/local/bin/python3 \
    && ln -s /usr/local/bin/pip$PYTHON_VERSION_LN /usr/local/bin/pip3
WORKDIR /tmp/python
VOLUME [ "/tmp/python" ]
