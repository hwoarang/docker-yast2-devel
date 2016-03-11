FROM opensuse:tumbleweed
MAINTAINER Markos Chandras <mchandras@suse.de>

# Update it
RUN zypper ref && zypper -n up

# Install all the needed ruby goodies
RUN zypper -n in yast2 yast2-testsuite \
    yast2-python-bindings \
    yast2-ruby-bindings ruby*-rubygem-rspec* \
    ruby*-rubygem-yast-rake \
    yast2-ycp-ui-bindings-devel \
    automake autoconf make which \
    osc git shadow sudo vim less

# Default user
ENV USER=devuser
ENV HOME /home/${USER}
ENV WORKDIR /home/${USER}

# Fix sudoers file to allow wheel group to do anything
RUN echo "%wheel ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

ADD wrap_bash.sh /usr/sbin

ENTRYPOINT ["wrap_bash.sh"]
