FROM centos 


RUN useradd -ms /bin/bash -p tpstps iris

RUN yum -y install libaio.x86_64 doxygen libaio-devel.x86_64 unzip python-devel mlocate gcc gcc-c++ vim openssl-libs.x86_64 openssl-devel.x86_64 make gdb.x86_64

RUN yum clean all

COPY hiredis.zip /home
WORKDIR /home
RUN unzip hiredis.zip
WORKDIR /home/hiredis
RUN make \
&& make install 
COPY cmake-3.12.0-rc1.tar.gz /home
COPY boost.tar.gz /home
WORKDIR /home
COPY node-v8.11.3.tar.gz /home
COPY wsdlpull-1.24.tar.gz /home
COPY zeromq-4.2.3.tar.gz /home
COPY msgpack-c-master.zip /home
COPY cppzmq-master.zip /home
COPY oracle-instantclient11.2-basic-11.2.0.4.0-1.x86_64.rpm /home
COPY oracle-instantclient11.2-devel-11.2.0.4.0-1.x86_64.rpm /home
WORKDIR /home
RUN tar -xvf cmake-3.12.0-rc1.tar.gz 
WORKDIR cmake-3.12.0-rc1
RUN ./bootstrap \
&& make \
&& make install
WORKDIR /home
RUN tar -xvf boost.tar.gz 
WORKDIR boost_1_59_0 
RUN ./bootstrap.sh \
&& ./b2 install; exit 0
WORKDIR /home
RUN rpm -ivh oracle-instantclient11.2-basic-11.2.0.4.0-1.x86_64.rpm
RUN rpm -ivh oracle-instantclient11.2-devel-11.2.0.4.0-1.x86_64.rpm
RUN tar -xvf  wsdlpull-1.24.tar.gz 
WORKDIR wsdlpull-1.24
RUN ./configure \
&& make \
&& make install \
&& cp /home/wsdlpull-1.24/src/wsdlparser/*.h  /usr/local/include/wsdlpull/wsdlparser/ \
&& mkdir /usr/local/include/wsdlpull/xmlpull \
&& cp /home/wsdlpull-1.24/src/xmlpull/*.h /usr/local/include/wsdlpull/xmlpull
WORKDIR /home
RUN tar -xvf zeromq-4.2.3.tar.gz 
WORKDIR zeromq-4.2.3 
RUN ./configure \
&& make \
&& make install 
WORKDIR /home
RUN yum install -y git net-tools
RUN unzip cppzmq-master 
WORKDIR cppzmq-master
RUN cmake . \
&& make install	
WORKDIR /home
RUN unzip msgpack-c-master.zip
WORKDIR msgpack-c-master
RUN cmake . \
&& make \
&& make install 
WORKDIR /home
RUN tar -xvf node-v8.11.3.tar.gz
WORKDIR node-v8.11.3
RUN ./configure \
&& make \
&& make install
EXPOSE 22
EXPOSE 8000-9000
RUN npm install -g typescript
RUN npm install -g node-gyp
WORKDIR /home
RUN rm msgpack* -rf && rm cmake-3* -rf && rm zeromq-4* -rf && rm node-v8* -rf &&  rm cppzmq-master* -rf && rm wsdlpull* -rf && rm boost* -rf && rm -rf oracle-instantclient11.2* && rm -rf hiredis*
