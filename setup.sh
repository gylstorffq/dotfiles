#!/bin/sh
# english keyboard layout
ubuntu_codename=$(lsb_release -a | sed -n -e 's/^.*Codename:\t//p')
sudo sed -ie '/^XKBLAYOUT=/s/".*"/"us"/' /etc/default/keyboard
sudo sed -ie '/^XKBVARIANT=/s/".*"/"altgr-intl"/' /etc/default/keyboard
udevadm trigger --subsystem-match=input --action=change
# my tools
echo "tools"
sudo apt-get -y install --force-yes vim python-software-properties software-properties-common \
 terminator lynx-cur checkinstall docbook-utils dblatex xmlto xutils-dev nfs-common patchutils \
 htop corkscrew minicom libevent1-dev exuberant-ctags python-pygments

echo "add groups"
sudo usermod -a -G tty $USER
sudo usermod -a -G dialout $USER

echo "tmux"
sudo apt-get -y build-dep tmux
cd $HOME/Downloads
TMUX_VERSION=tmux-2.3
TMUX_TARBALL=$TMUX_VERSION.tar.gz
wget --no-check-certificate https://github.com/tmux/tmux/releases/download/2.3/$TMUX_TARBALL
tar -xzf $TMUX_TARBALL
cd $TMUX_VERSION
./configure
make -s
sudo checkinstall

# use my own tmux config
if [ -d $MY_DOTFILES_DIR ]
then
    if [ ! -L $HOME/.tmux.conf ]
	then
        ln -s $MY_DOTFILES_DIR/configs/tmux.conf $HOME/.tmux.conf
	fi
fi
#bash-it own config
echo "bash-it"
if [ ! -d $HOME/.bash_it ]
then
	  git clone --depth=1 https://github.com/Bash-it/bash-it.git ~/.bash_it
	  ~/.bash_it/install.sh --silent
fi
#emacs
if [ !  -d $HOME/.emacs.d ] &&  [ ! -d $HOME/.spacemacs.d ]
then
	LIST_FILE="/etc/apt/sources.list.d/emacs-ppa.list"
	CHECK_CONTENT=$(grep -Fxq "deb http://ppa.launchpad.net/kelleyk/emacs/ubuntu $ubuntu_codename main" $LIST_FILE)
	if [ ! -e $LIST_FILE ] || [ ! CHECK_CONTENT ] 
	then
	   sudo touch $LIST_FILE
           sudo chmod +rw $LIST_FILE
           sudo chown $USER $LIST_FILE
	   sudo echo "deb http://ppa.launchpad.net/kelleyk/emacs/ubuntu $ubuntu_codename main" >> $LIST_FILE
	   sudo echo "deb-src http://ppa.launchpad.net/kelleyk/emacs/ubuntu $ubuntu_codename main " >> $LIST_FILE
	fi
	ARG=$(sudo apt-get update  2>&1 | sed -n -e 's/^.*NO_PUBKEY //p')
	gpg --keyserver hkp://keyserver.ubuntu.com:80 --recv-key $ARG && gpg --export --armor $ARG | sudo apt-key add -
	sudo apt-get install emacs25 -y --force-yes
	git clone https://github.com/syl20bnr/spacemacs $HOME/.emacs.d
	if [ ! -L $HOME/.spacemacs.d ]
	then
		ln -s $MY_DOTFILES_DIR/configs/spacemacs.d $HOME/.spacemacs.d
	fi
fi
# gtags
cd $HOME/Downloads
GLOBAL=global-6.6.1
GLOBAL_TARBALL=$GLOBAL.tar.gz
wget --no-check-certificate https://ftp.gnu.org/pub/gnu/global/$GLOBAL_TARBALL
tar -xzf $GLOBAL_TARBALL
cd $GLOBAL 
./configure --with-exuberant-ctags=/usr/bin/ctags
make -s
sudo make install

#bear
git clone https://github.com/rizsotto/Bear.git ~/.Bear
mkdir -p ~/Bear-build
cd ~/Bear-build
cmake ~/.Bear
make all
sudo make install


# terminator config
echo "terminator config"
TERM_CONFIG_DIR=$HOME/.config/terminator/
TERM_CONFIG_FILE=$HOME/.config/terminator/config
TERM_GIT_DIR=$HOME/.terminator-solarized
if [ ! -d $TERM_CONFIG_DIR ]
then
	  mkdir -p $TERM_CONFIG_DIR
fi
if [ ! -d $TERM_CONFIG_FILE ]; then
    if [ ! -d $MY_DOTFILES_DIR ]
    then
	      git clone https://github.com/ghuntley/terminator-solarized.git $TERM_GIT_DIR
	      cd $TERM_GIT_DIR
	      cp config $TERM_CONFIG_DIR/terminator
	      rm -rf $TERM_GIT_DIR
    fi
    ln -s $MY_DOTFILES_DIR/configs/terminator.config $TERM_CONFIG_DIR/config
fi

