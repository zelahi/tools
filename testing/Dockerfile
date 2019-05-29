FROM centos:7

# install repos for rpm installs
RUN yum update -y -q && \
	yum install -y -q epel-release && \
	yum install -y -q --enablerepo=epel-testing dpkg-dev dpkg

# ASDF - DELETE THIS, use it for testing
RUN yum install -y vim
RUN  mkdir -p /var/www/apt/pool/main && \
	 	 mkdir -p /var/www/apt/dists/stable/main/binary-i386 && \
	 	 mkdir -p /var/www/apt/dists/stable/main/binary-amd64

WORKDIR "/root"

EXPOSE 8080

CMD ["tail", "-f", "/dev/null"]
# ENTRYPOINT ["./entrypoint.sh"]
