FROM centos:6
MAINTAINER Petr Lomakin <plomakin@mirantis.com>

# Install git, python and essential tools
RUN yum -y update; \
    yum -y upgrade; \
    yum -y install git wget tar

# Setup Environment by Cloning tempest
# installing tempest dependencies
RUN git clone https://github.com/Mirantis/mos-tempest-runner.git
RUN cd /mos-tempest-runner; \
    git checkout origin/stable/6.1; \
    ./setup_env.sh

CMD ["/bin/bash"]
