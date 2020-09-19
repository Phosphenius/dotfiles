FROM archlinux:latest

RUN pacman -Sy
RUN yes | pacman -S vim ripgrep fzf htop ctags git lsd bat

RUN useradd archuser && \
    echo "ALL            ALL = (ALL) NOPASSWD: ALL" >> /etc/sudoers

WORKDIR /home/archuser
ENV HOME /home/archuser

RUN chown -R archuser:archuser $HOME

USER archuser
