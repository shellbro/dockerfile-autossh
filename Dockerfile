FROM shellbro/centos:7.8.2003-1589640061

RUN yum makecache && yum -y install epel-release &&\
    yum -y install autossh && yum clean all &&\
    >&2 echo -n 'Version: ' && >&2 rpm -q autossh &&\
    groupadd -g 1001 non-root && useradd -u 1001 -g 1001 non-root

USER non-root

ENTRYPOINT ["/usr/bin/autossh"]
