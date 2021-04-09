#!/bin/bash
# make sure we're root
if [ "$HOME" != "/root" ]
then
    echo -e "${GREEN}[*] Please run as root.${NC}"
    exit 1
fi

#Colors
GREEN='\033[0;32m'
NC='\033[0m'

#Install dependencies
echo -e "${GREEN}[*] Apt update${NC}"
apt-get update

#Install xterm
echo -e "${GREEN}[*] Installing XTERM${NC}"
apt-get install xterm

#Install pip3
echo -e "${GREEN}[*] Installing Python3-pip${NC}"
apt-get install -y python3-pip

#Install venv for pipx virtual environments
echo -e "${GREEN}[*] Installing Python3-venv${NC}"
apt-get install -y python3-venv

#Install pipx 
echo -e "${GREEN}[*] Installing Pipx${NC}"
xterm -e bash -c 'python3 -m pip install pipx; python3 -m pipx ensurepath'

#Make bash default shell
echo -e "${GREEN}[*] Change default shell to bash${NC}"
chsh -s /bin/bash

# Make sure pipx is installed
echo -e "${GREEN}[*] Checking if PIPX is installed${NC}"
if pip list | grep -F pipx &> /dev/null; then
    echo -e "${GREEN}[*] Pipx installed${NC}"
else
    echo 'uh oh. Pipx is not installed.'
    exit 1
fi

#Install other dependencies
echo -e "${GREEN}[*] Installing Dependencies that arent tools${NC}"
apt-get install -y rlwrap
apt-get install -y gnome-screenshot
apt-get install -y golang
apt-get install -y powershell
apt-get install -y xclip
apt-get install -y cmake
apt-get install -y grc
apt-get install -y awscli
apt-get install -y build-essential
apt-get install -y gcc 
apt-get install -y git
apt-get install -y vim 
apt-get install -y wget 
apt-get install -y curl
apt-get install -y inetutils-ping 
apt-get install -y make 
apt-get install -y nmap 
apt-get install -y whois 
apt-get install -y python-pip 
apt-get install -y perl 
apt-get install -y nikto
apt-get install -y dnsutils 
apt-get install -y net-tools
apt-get install -y zsh
apt-get install -y nano
apt-get install -y tmux

#Need to uninstall
#sudo rm /usr/bin/lsb_release

#Install ferox buster
echo -e "${GREEN}[*] Installing Feroxbuster${NC}"
apt install -y feroxbuster

#Install pure-ftpd
echo -e "${GREEN}[*] Installing pure-ftpd${NC}"
apt install -y pure-ftpd

#Install fcrackzip for cracking zip files with passwords
echo -e "${GREEN}[*] Installing fcrackzip${NC}"
apt-get install fcrackzip

#Install seclists for passwords
echo -e "${GREEN}[*] Installing Seclists${NC}"
apt-get install seclists

#Install Python ssl module
echo -e "${GREEN}[*] Installing Python SSL Module${NC}"
sudo apt-get install -y libreadline-gplv2-dev libncursesw5-dev libssl-dev libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev

#Install fzf for CommandLine
echo -e "${GREEN}[*] Installing FZF${NC}"
apt-get install fzf

#Install exa
echo -e "${GREEN}[*] Installing EXA${NC}"
apt install exa

# enable command aliasing
echo -e "${GREEN}[*] Enable Command Aliasing${NC}"
shopt -s expand_aliases

#Reinstall vim 
echo -e "${GREEN}[*] Reinstalling VIM${NC}"
sudo apt install -y libncurses5-dev libgtk2.0-dev libatk1.0-dev \
libcairo2-dev libx11-dev libxpm-dev libxt-dev python2-dev \
python3-dev ruby-dev lua5.2 liblua5.2-dev libperl-dev git 

sudo apt remove -y vim vim-runtime gvim 
sudo apt remove -y vim-tiny vim-common vim-gui-common vim-nox 
cd ~
git clone https://github.com/vim/vim.git
cd vim
./configure --with-features=huge \
            --enable-multibyte \
            --enable-rubyinterp=yes \
            --enable-python3interp=yes \
            --with-python3-config-dir=$(python3-config --configdir) \
            --enable-perlinterp=yes \
            --enable-luainterp=yes \
            --enable-gui=gtk2 \
            --enable-cscope \
            --prefix=/usr/local


make VIMRUNTIMEDIR=/usr/local/share/vim/vim82
cd ~/vim
sudo make install
sudo update-alternatives --install /usr/bin/editor editor /usr/local/bin/vim 1
sudo update-alternatives --set editor /usr/local/bin/vim
sudo update-alternatives --install /usr/bin/vi vi /usr/local/bin/vim 1
sudo update-alternatives --set vi /usr/local/bin/vim


#Make folders
cd /home/kali/Desktop/
mkdir -p Bug

#Create Tools Dir
cd ~/
mkdir -p Tools
mkdir -p Scripts

#Install python2to3
echo -e "${GREEN}[*] Installing 2to3${NC}"
python3 -m pipx install 2to3

#Install tldr 
echo -e "${GREEN}[*] Installing tldr${NC}"
python3 -m pipx install tldr.py

#Install Impacket
echo -e "${GREEN}[*] Installing Impacket${NC}"
python3 -m pipx install git+https://github.com/SecureAuthCorp/impacket.git
python3 -m pipx ensurepath

#Make setup folder
echo -e "${GREEN}[*] Installing BugBounty Github${NC}"
cd /home/kali/Desktop/Bug
git clone https://github.com/Gfuen/BugBounty.git

#Unzip Rockyou
echo -e "${GREEN}[*] Installing rockyou.txt${NC}"
gunzip /usr/share/wordlists/rockyou.txt.gz 2>/dev/null
ln -s /usr/share/wordlists ~/Downloads/wordlists 2>/dev/null

#Install packages for dirsearch
echo -e "${GREEN}[*] Installing dirsearch${NC}"
python3 -m pipx install urllib3
python3 -m pipx install chardet
python3 -m pipx install certifi

cd ~/Tools
git clone https://github.com/maurosoria/dirsearch.git

#Install Autorecon
echo -e "${GREEN}[*] Installing Autorecon${NC}"
python3 -m pipx install git+https://github.com/Tib3rius/AutoRecon.git
python3 -m pipx ensurepath

#Install Nishang
echo -e "${GREEN}[*] Installing Nishang${NC}"
cd ~/Tools
git clone https://github.com/samratashok/nishang.git

# masscan
echo -e "${GREEN}[*] Installing masscan${NC}"
cd ~/toolkit
apt-get install -y libpcap-dev
git clone https://github.com/robertdavidgraham/masscan.git
cd masscan
make
ln -sf ~/toolkit/masscan/bin/masscan /usr/local/bin/masscan    

# dnsenum
echo -e "${GREEN}[*] Installing dnsenum${NC}"
apt-get install -y cpanminus 
cd ~/toolkit 
git clone https://github.com/fwaeytens/dnsenum.git 
cd dnsenum/ 
chmod +x dnsenum.pl 
ln -s ~/toolkit/dnsenum/dnsenum.pl /usr/bin/dnsenum 
cpanm String::Random 
cpanm Net::IP 
cpanm Net::DNS 
cpanm Net::Netmask
cpanm XML::Writer

# massdns
echo -e "${GREEN}[*] Installing massdns${NC}"
apt-get install -y libldns-dev
cd ~/toolkit 
git clone https://github.com/blechschmidt/massdns.git
cd massdns/
make
ln -sf ~/toolkit/massdns/bin/massdns /usr/local/bin/massdns

# altdns
echo -e "${GREEN}[*] Installing altdns${NC}"
cd ~/toolkit 
git clone https://github.com/infosec-au/altdns.git 
cd altdns 
pip3 install -r requirements.txt 
chmod +x setup.py 
python setup.py install

# thc-hydra
echo -e "${GREEN}[*] Installing thc-hydra${NC}"
apt-get install -y hydra

# Sublist3r
echo -e "${GREEN}[*] Installing Sublist3r${NC}"
cd ~/toolkit 
git clone https://github.com/aboul3la/Sublist3r.git
cd Sublist3r/
pip3 install -r requirements.txt
ln -s ~/toolkit/Sublist3r/sublist3r.py /usr/local/bin/sublist3r

# knock
echo -e "${GREEN}[*] Installing Knockpy${NC}"
apt-get install -y python-dnspython 
cd ~/toolkit
git clone https://github.com/guelfoweb/knock.git
cd knock
chmod +x setup.py
python setup.py install

# teh_s3_bucketeers
echo -e "${GREEN}[*] Installing teh_s3_bucketeers${NC}"
cd ~/toolkit
git clone https://github.com/tomdev/teh_s3_bucketeers.git 
cd teh_s3_bucketeers 
chmod +x bucketeer.sh 
ln -sf ~/toolkit/teh_s3_bucketeers/bucketeer.sh /usr/local/bin/bucketeer

# Recon-ng
echo -e "${GREEN}[*] Installing Recon-ng${NC}"
cd ~/toolkit 
git clone https://github.com/lanmaster53/recon-ng.git 
cd recon-ng 
pip3 install -r REQUIREMENTS 
chmod +x recon-ng 
ln -sf ~/toolkit/recon-ng/recon-ng /usr/local/bin/recon-ng

# XSStrike
echo -e "${GREEN}[*] Installing XSStrike${NC}"
cd ~/toolkit
git clone https://github.com/s0md3v/XSStrike.git 
cd XSStrike 
pip3 install -r requirements.txt 
chmod +x xsstrike.py
ln -sf ~/toolkit/XSStrike/xsstrike.py /usr/local/bin/xsstrike

# sqlmap
echo -e "${GREEN}[*] Installing sqlmap${NC}"
apt-get install -y sqlmap

# wfuzz
echo -e "${GREEN}[*] Installing wfuzz${NC}"
pip3 install --upgrade setuptools 
apt-get install -y python-pycurl 
pip3 install wfuzz

# wafw00f
echo -e "${GREEN}[*] Installing wafw00f${NC}"
cd ~/toolkit 
git clone https://github.com/enablesecurity/wafw00f.git 
cd wafw00f 
chmod +x setup.py 
python setup.py install

# wpscan
echo -e "${GREEN}[*] Installing wpscan${NC}"
apt-get install -y libcurl4-openssl-dev libxml2 libxml2-dev libxslt1-dev ruby-dev libgmp-dev zlib1g-dev 
cd ~/toolkit 
git clone https://github.com/wpscanteam/wpscan.git 
cd wpscan/ 
gem install bundler && bundle install --without test 
gem install wpscan

# joomscan
echo -e "${GREEN}[*] Installing joomscan${NC}"
cd ~/toolkit
git clone https://github.com/rezasp/joomscan.git 
cd joomscan/ 
apt-get install -y libwww-perl 
chmod +x joomscan.pl
#ln -sf ~/toolkit/joomscan/joomscan.pl /usr/local/bin/joomscan

# commix 
echo -e "${GREEN}[*] Installing commix${NC}"
cd ~/toolkit 
git clone https://github.com/commixproject/commix.git 
cd commix 
chmod +x commix.py 
ln -sf ~/toolkit/commix/commix.py /usr/local/bin/commix

# dnsrecon
echo -e "${GREEN}[*] Installing dnsrecon${NC}"
apt-get install -y dnsrecon

# virtual-host-discovery
cd ~/toolkit 
git clone https://github.com/AlexisAhmed/virtual-host-discovery.git 
cd virtual-host-discovery 
chmod +x scan.rb 
ln -sf ~/toolkit/virtual-host-discovery/scan.rb /usr/local/bin/virtual-host-discovery

# theHarvester
echo -e "${GREEN}[*] Installing theHarvester${NC}"
cd ~/toolkit 
git clone https://github.com/AlexisAhmed/theHarvester.git 
cd theHarvester 
python3 -m pip install -r requirements.txt 
chmod +x theHarvester.py
ln -sf ~/toolkit/theHarvester/theHarvester.py /usr/local/bin/theharvester

# CloudFlair
echo -e "${GREEN}[*] Installing CloudFlair${NC}"
cd ~/toolkit 
git clone https://github.com/christophetd/CloudFlair.git 
cd CloudFlair 
pip3 install -r requirements.txt 
chmod +x cloudflair.py 
ln -sf ~/toolkit/CloudFlair/cloudflair.py /usr/local/bin/cloudflair

# bucket_finder
echo -e "${GREEN}[*] Installing bucket_finder${NC}"
cd ~/toolkit 
git clone https://github.com/AlexisAhmed/bucket_finder.git 
cd bucket_finder 
chmod +x bucket_finder.rb 
ln -sf ~/toolkit/bucket_finder/bucket_finder.rb /usr/local/bin/bucket_finder

# s3recon
echo -e "${GREEN}[*] Installing s3recon${NC}"
pip3 install setuptools pyyaml pymongo requests s3recon

# subfinder
echo -e "${GREEN}[*] Installing subfinder${NC}"
go get -v github.com/projectdiscovery/subfinder/cmd/subfinder

# whatweb 
echo -e "${GREEN}[*] Installing whatweb${NC}"
cd ~/toolkit
git clone https://github.com/urbanadventurer/WhatWeb.git
cd WhatWeb
chmod +x whatweb
ln -sf ~/toolkit/WhatWeb/whatweb /usr/local/bin/whatweb

# fierce
echo -e "${GREEN}[*] Installing fierce${NC}"
python3 -m pipx install fierce

# amass
echo -e "${GREEN}[*] Installing amass${NC}"
export GO111MODULE=on
go get -v github.com/OWASP/Amass/v3/...

#Install vundle
echo -e "${GREEN}[*] Installing Vundle${NC}"
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

#Back up vim file
echo -e "${GREEN}[*] Backup VIM${NC}"
if [ -e .vimrc ]; then mv .vimrc .vimrc_bak; fi
if [ -e .vim ]; then mv .vim .vim_bak; fi

#Install Tmux plugin manager
echo -e "${GREEN}[*] Installing Tmux plugin manager${NC}"
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

#Replace Config files
echo -e "${GREEN}[*] Replace Config files${NC}"
cd /home/kali/Desktop/PWK/Setup
dos2unix .bashrc
dos2unix .vimrc
dos2unix .tmux.conf
cp -rfv .vimrc .bashrc .tmux.conf ~/
sudo ln -sfv ~/.bashrc /root/.bashrc
sudo ln -sfv ~/.vimrc /root/.vimrc

#Install Vim Plugins
echo -e "${GREEN}[*] Installing VIM Plugins${NC}"
vim +PluginInstall +qall

#Refresh bash profile before installing pyenv
echo -e "${GREEN}[*] Reload Bash profile${NC}"
source ~/.bashrc

#Install pyenv
echo -e "${GREEN}[*] Installing Pyenv${NC}"
apt install -y build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev xz-utils tk-dev libffi-dev liblzma-dev python3-openssl git
curl https://pyenv.run | bash
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n  eval "$(pyenv init -)"\nfi' >> ~/.bashrc
