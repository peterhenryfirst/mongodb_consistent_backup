FROM centos:centos7
MAINTAINER Tim Vaillancourt <tim.vaillancourt@percona.com>
RUN yum install -y https://www.percona.com/redir/downloads/percona-release/redhat/latest/percona-release-0.1-4.noarch.rpm epel-release && \
	yum install -y Percona-Server-MongoDB-32-tools zbackup && yum clean all && \
	curl -Lo /usr/bin/mongodb-consistent-backup https://github.com/Percona-Lab/mongodb_consistent_backup/releases/download/1.0.1/mongodb-consistent-backup.el7.centos.x86_64 && \
	chmod +x /usr/bin/mongodb-consistent-backup
ENTRYPOINT ["mongodb-consistent-backup"]
CMD ["--help"]
