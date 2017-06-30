FROM tiramizu/ror:1.0

RUN  yum install -y bzip2 gcc readline readline-devel zlib zlib-devel net-tools nc vim &&\
  wget  https://ftp.postgresql.org/pub/source/v9.6.3/postgresql-9.6.3.tar.bz2 &&\ 
  tar -xf postgresql-9.6.3.tar.bz2 &&\ 
  cd postgresql-9.6.3 &&\
  ./configure && make && make install &&\
  rm -rf /postgresql-9.6.3  
ENV PATH=$PATH:/usr/local/pgsql/bin
CMD ["ruby","/entrypoint1.rb"]
COPY entrypoint1.rb /entrypoint1.rb
VOLUME /data