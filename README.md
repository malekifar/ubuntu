# How to install Ubuntu 20.04 + VScode + Anaconda + Git + ZSH
## Table of Contents
- Ubuntu
  - 
    - From Mac
      - Create a bootable USB stick on macOS
      - Resize Partition
      - Boot
    - From Windows
      - Create a bootable USB stick on Windows
      - shrink partition
      - Boot
      - From Linux 
    - Create a bootable USB stick on Ubuntu
      - Resize Partition
      - Boot
Installing

- [VSCode](#VSCode)
  - [Installing](#installing)
    - [Method1 Using Setup File](#method1-using-setup-files)
    - [Method2 Using Windows Package Manager](#method2-using-windows-package-manager)
  - [Configuring](#configuring)
  - [Extensions](#extensions)
    - [Best Extensions](#best-extensions)
- [Anaconda](#anaconda)
  - [Installing](#installing-2)
  - [Conda init](#conda-init)
- [Git](#git)
- [ZSH](#ZSH)
  - [Installing](#installing-3)
  - [Installing oh-my-zsh](#installing-oh-my-zsh)
  - [Conda init](#onda-init-1)
  - [ZSH Plugins](#zsh-plugins)
    - [fuzzy finder fzf](#fuzzy-finder-fzf)
    - [autojump](#autojump)
    - [zsh-autosuggestions](#zsh-autosuggestions)
    - [enhancd](#enhancd)
    - [zsh-completions](#zsh-completions)
    - [fast Syntax Highlighting](#fast-syntax-highlighting)
    - [git, docker, colored-man-pages, colorize, dash & command-not-found](#git-docker-colored-man-pages-colorize-dash--command-not-found)
  - [ZSH Themes](#zsh-themes)
    - [PowerLevel10K](#Installing-PowerLevel10K)
    - [Agnoster](#agnoster)
    - [robbyrussell](#robbyrussell)
- VIM => coming soon
###### Method1 Using Ubuntu's Advanced Packaging (APT)
Open Terminal and Type the following command to install Visual Studio Code:
```zsh
sudo apt update && sudo apt install software-properties-common curl apt-transport-https && cd /tmp && wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg && sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/ && sudo sh -c 'echo "deb [arch=amd64 signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list' && sudo apt update && sudo apt install code
```
###### Method2 Using Snap
```
sudo snap install --classic code
```
## [Anaconda](https://www.anaconda.com/)
### Installing
Type the following command to download Anaconda in tmp folder and install it then press Enter:
- For x86:
```zsh
sudo apt install curl && cd /tmp && curl https://repo.anaconda.com/archive/Anaconda3-2021.05-Linux-x86_64.sh --output anaconda.sh && bash anaconda.sh
```
- For ARM64:
```zsh
sudo apt install curl && cd /tmp && curl https://repo.anaconda.com/archive/Anaconda3-2021.05-Linux-aarch64.sh --output anaconda.sh && bash anaconda.sh
```
You’ll receive these following outputs:
```
Output:

Welcome to Anaconda3 2021.05

In order to continue the installation process, please review the license
agreement.
Please, press ENTER to continue
>>>  
```
Press <kbd>Enter</kbd> to continue and then press <kbd>Enter</kbd> to read through the license. Once you’re done reading the license, you’ll be prompted to approve the license terms:
```
Output:

Do you approve the license terms? [yes|no]
```
As long as you agree, type `yes`.
```
Output:

Anaconda3 will now be installed into this location:
/home/usename/anaconda3

  - Press ENTER to confirm the location
  - Press CTRL-C to abort the installation
  - Or specify a different location below

[/home/username/anaconda3] >>> 
```
At this point, you’ll be prompted to choose the location of the installation. You can press <kbd>Enter</kbd> to accept the default location, or specify a different location to modify it.
```
output:

Preparing transaction: done
Executing transaction: done
installation finished.
Do you wish the installer to initialize Anaconda3
by running conda init? [yes|no]
[no] >>> 
```
Type `yes` so that you can initialize Anaconda3. You’ll receive some output that states changes made in various directories. One of the lines you receive will thank you for installing Anaconda.
```
Output:

Thank you for installing Anaconda3!
```
### Conda init
```zsh
source ~/anaconda3/etc/profile.d/conda.sh && conda init bash && conda init zsh
```
## [Git](https://github.com/git/git)
Install Git using apt-get:
```zsh
sudo apt-get update && sudo apt-get install git
```
## [ZSH](https://github.com/zsh-users/zsh)
### Installing
Type the following commands to update apt and install zsh then press Enter:

```zsh
sudo apt update && sudo apt install zsh
```

Now set zsh to be your default shell:
this command reboot your computer
```zsh
chsh -s $(which zsh) && reboot
```
Open a new terminal and the initial zsh prompt will show up, signaling that zsh is now the default shell. At this point pick <kbd>2</kbd> — it will populate the zsh configuration file `~/.zshrc` with defaults.

Let’s check again that zsh is the default shell:

```zsh
echo $SHELL && $SHELL --version
```

you should get the following results:

![shell version](https://raw.githubusercontent.com/malekifar/wsl/main/screenshots/shell%20version.jpg)

### Installing [oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh)
Now we can install oh-my-zsh

```zsh
sudo apt install curl && sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

Notice that oh-my-zsh updated your `~/.bashrc` file and made a backup of the old one. Also notice that the prompt changed now, it is just your username.

OK, we are readty to customize oh-my-zsh next.
### Conda init
```zsh
source ~/anaconda3/etc/profile.d/conda.sh && conda init zsh
```
### ZSH Plugins
Oh-My-ZSH has many plugins. You can find a list of pre-installed plugins at [here](https://github.com/robbyrussell/oh-my-zsh/tree/master/plugins)

###### [fuzzy finder fzf](https://github.com/junegunn/fzf)
```zsh
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.zsh/.fzf && ~/.zsh/.fzf/install
```
###### [autojump](https://github.com/wting/autojump)
```zsh
git clone git://github.com/wting/autojump.git ~/.zsh/autojump && cd ~/.zsh/autojump && ./install.py && echo "source ~/.autojump/etc/profile.d/autojump.sh" >> ~/.zshrc && pkill terminal
```
###### [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)
```zsh
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions && echo "source ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh" >> ~/.zshrc
```
###### [enhancd](https://github.com/b4b4r07/enhancd)
```zsh
git clone https://github.com/b4b4r07/enhancd ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/enhancd && echo "source ~/.oh-my-zsh/custom/plugins/enhancd/init.sh" >> ~/.zshrc
```
###### [zsh-completions](https://github.com/zsh-users/zsh-completions)
```zsh
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions && echo "source ~/.oh-my-zsh/custom/plugins/zsh-completions/zsh-completions.plugin.zsh" >> ~/.zshrc
```
###### [fast Syntax Highlighting](https://github.com/zdharma/fast-syntax-highlighting)
```zsh
git clone https://github.com/zdharma/fast-syntax-highlighting ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting && echo "source ~/.oh-my-zsh/custom/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh" >> ~/.zshrc
```
###### [git](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/git), [docker](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/docker), [colored-man-pages](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/colored-man-pages), [colorize](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/colorize), [dash](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/dash) & [command-not-found](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/command-not-found)
```zsh
sed -i 's/plugins=\(.*\)/plugins=\(git docker zsh-completions colored-man-pages fast-syntax-highlighting colorize dash command-not-found\)/g' ~/.zshrc
```
### ZSH Themes
We are going to make our color pretty and prompt useful. There are a lot of themes in oh-my-zsh, you can see them [here](https://github.com/ohmyzsh/ohmyzsh/wiki/Themes):
###### [PowerLevel10K](https://github.com/romkatv/powerlevel10k)(recommended)
- Installing
```zsh
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
```
- Enabling
```zsh
sed -i 's/ZSH_THEME=".*"/ZSH_THEME="powerlevel10k\/powerlevel10k"/g' ~/.zshrc
```
![powerlevel10k](https://raw.githubusercontent.com/malekifar/wsl/main/screenshots/powerlevel10k.jpg)
###### Agnoster
- Enabling
```zsh
sed -i 's/ZSH_THEME=".*"/ZSH_THEME="agnoster"/g' ~/.zshrc
```
- Hiding computer name
```zsh
echo "export DEFAULT_USER=$(whoami)" >> ~/.zshrc
```
![Agnoster](https://raw.githubusercontent.com/malekifar/wsl/main/screenshots/agnoster.jpg)
###### robbyrussell
```zsh
sed -i 's/ZSH_THEME=".*"/ZSH_THEME="robbyrussell"/g' ~/.zshrc
```
![robbyrussell](https://raw.githubusercontent.com/malekifar/wsl/main/screenshots/robbyrussell.jpg)
