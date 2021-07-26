#!/bin/sh
# Install VSCode Using APT
sudo apt update && sudo apt install software-properties-common curl apt-transport-https && cd /tmp && wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg && sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/ && sudo sh -c 'echo "deb [arch=amd64 signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list' && sudo apt update && sudo apt install code
# Configure VSCode
# Install VSCode Extensions
# Install Anaconda Silent Mode
sudo apt install curl && cd /tmp && curl https://repo.anaconda.com/archive/Anaconda3-2021.05-Linux-x86_64.sh --output anaconda.sh && bash anaconda.sh -b -p $HOME/anaconda
# Conda init to Bash
source ~/anaconda3/etc/profile.d/conda.sh ; source ~/anaconda/etc/profile.d/conda.sh ; conda init bash 
# Install Git
sudo apt-get update -y && sudo apt-get install -y git
# Install ZSH
sudo apt update && sudo apt install -y zsh
# Set ZSH to default shell
chsh -s $(which zsh) ; sudo sed -i 's/\/usr\/bin\/bash/\/usr\/bin\/zsh/g' /etc/passwd ‌; sudo sed -i 's/\/bin\/bash/\/bin\/zsh/g' /etc/passwd
# Install oh-my-zsh
sudo apt install -y curl && sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# Conda init to ZSH
source ~/anaconda3/etc/profile.d/conda.sh ; source ~/anaconda/etc/profile.d/conda.sh ; conda init zsh
# Open ZSH
zsh
# Install ZSH Plugins
# fuzzy finder fzf
rm -rf ~/.zsh/.fzf ; git clone --depth 1 https://github.com/junegunn/fzf.git ~/.zsh/.fzf && yes | bash ~/.zsh/.fzf/install
# autojump
rm -rf ~/.zsh/autojump ; git clone git://github.com/wting/autojump.git ~/.zsh/autojump && cd ~/.zsh/autojump && yes |./install.py && echo "source ~/.autojump/etc/profile.d/autojump.sh" >> ~/.zshrc 
# zsh-autosuggestions
rm -rf ~/.oh-my-zsh/custom/plugins/zsh-completions/ ; git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions && echo "source ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh" >> ~/.zshrc
# enhancd
rm -rf ~/.oh-my-zsh/custom/plugins/enhancd ; git clone https://github.com/b4b4r07/enhancd ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/enhancd && echo "source ~/.oh-my-zsh/custom/plugins/enhancd/init.sh" >> ~/.zshrc
# zsh-completions
rm -rf ~/.oh-my-zsh/custom/plugins/zsh-completions ; git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions && echo "source ~/.oh-my-zsh/custom/plugins/zsh-completions/zsh-completions.plugin.zsh" >> ~/.zshrc
# fast Syntax Highlighting
rm -rf ~/.oh-my-zsh/custom/plugins/fast-syntax-highlighting ; git clone https://github.com/zdharma/fast-syntax-highlighting ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting && echo "source ~/.oh-my-zsh/custom/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh" >> ~/.zshrc
# git, docker, colored-man-pages, colorize, dash & command-not-found, extract
sed -i 's/plugins=\(.*\)/plugins=\(git docker zsh-completions colored-man-pages fast-syntax-highlighting colorize dash command-not-found extract\)/g' ~/.zshrc
# Open ZSH
zsh
# ZSH Fonts
sudo apt-get install -y unzip && cd /tmp && wget https://github.com/malekifar/ubuntu/releases/download/v1.0/Fonts.zip -O Fonts.zip && unzip -o Fonts.zip && sudo bash install.sh ; /bin/gsettings set org.gnome.desktop.interface monospace-font-name "MesloLGS NF Bold 13"
# Color Schemes 
sudo apt-get install -y dconf-editor dconf-cli uuid-runtime && yes ALL | bash -c "$(wget -qO- https://git.io/vQgMr)"
# ZSH Themes
# Installing
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
# Enabling
sed -i 's/ZSH_THEME=".*"/ZSH_THEME="powerlevel10k\/powerlevel10k"/g' ~/.zshrc
# Hiding Computer Name
echo "export DEFAULT_USER=$(whoami)" >> ~/.zshrc
# Open ZSH
zsh
# configuring
p10k configure

