FROM node:0.11-onbuild
MAINTAINER Joey Hipolito <hi@joeyhipolito.com>

ENV HOME /root

RUN apt-get update
RUN apt-get install zsh vim -y
RUN apt-get autoremove --purge -y
RUN curl -L http://install.ohmyz.sh | bash 
RUN mkdir -p /root/.vim/autoload /root/.vim/bundle && curl -LSso /root/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
RUN mkdir -p /root/.vim/colors && curl -LSso /root/.vim/colors/molokai.vim https://bitbucket.org/sjl/dotfiles/raw/e6f6389e598f33a32e75069d7b3cfafb597a4d82/vim/colors/molokai.vim
COPY .vimrc /root/.vimrc
EXPOSE 8080

CMD ["node","app/app.js"]
