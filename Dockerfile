FROM archlinux:latest

RUN pacman -Sy
RUN yes | pacman -S vim ripgrep fzf htop ctags git lsd bat

RUN useradd archuser && \
    echo "ALL            ALL = (ALL) NOPASSWD: ALL" >> /etc/sudoers

WORKDIR /home/archuser
ENV HOME /home/archuser

RUN chown -R archuser:archuser $HOME

RUN mkdir -p $HOME/.vim/bundle/
RUN git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
USER archuser
