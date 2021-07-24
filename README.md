# How to install Ubuntu 20.04 + VScode + Anaconda + Git + ZSH
## Table of Contents
- Ubuntu => Coming soon
  - Preparation
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
  - Installing

- [VSCode](#VSCode)
  - [Installing](#installing)
    - [Method1 Using Ubuntu's Advanced Packaging (APT)](#ubuntu#method1-using-ubuntus-advanced-packaging-apt)
    - [Method2 Using Snap](#method2-using-snap)
  - [Configuring](#configuring)
  - [Extensions](#extensions)
    - [Best Extensions](#best-extensions)
- [Anaconda](#anaconda)
  - [Installing](#installing-2)
  - [Conda init](#conda-init)
- [Git](#git)
- [ZSH](#ZSH)
  - [Installing](#installing-2)
  - [Installing oh-my-zsh](#installing-oh-my-zsh)
  - [Conda init](#conda-init-1)
  - [ZSH Plugins](#zsh-plugins)
    - [fuzzy finder fzf](#fuzzy-finder-fzf)
    - [autojump](#autojump)
    - [zsh-autosuggestions](#zsh-autosuggestions)
    - [enhancd](#enhancd)
    - [zsh-completions](#zsh-completions)
    - [fast Syntax Highlighting](#fast-syntax-highlighting)
    - [git, docker, colored-man-pages, colorize, dash & command-not-found](#git-docker-colored-man-pages-colorize-dash--command-not-found)
  - [ZSH Fonts](#zsh-fonts)
  - [Color Schemes](#color-schemes)
  - [ZSH Themes](#zsh-themes)
    - [PowerLevel10K](#Installing-PowerLevel10K)
    - [Agnoster](#agnoster)
    - [robbyrussell](#robbyrussell)
- VIM => coming soon
## [VSCode](https://github.com/microsoft/vscode)
### Installing
###### Method1 Using Ubuntu's Advanced Packaging (APT)
Open Terminal and Type the following command to install Visual Studio Code:
```zsh
sudo apt update && sudo apt install software-properties-common curl apt-transport-https && cd /tmp && wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg && sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/ && sudo sh -c 'echo "deb [arch=amd64 signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list' && sudo apt update && sudo apt install code
```
###### Method2 Using Snap
```
sudo snap install --classic code
```
### Configuring
To edit your VS Code configuration in JSON, open the command palette (Go to View -> Command Palette, or Press <kbd>Ctrl</kbd> + <kbd>Shift</kbd> + <kbd>P</kbd>), type `Open Settings JSON` and select `Preferences: Open Settings (JSON)`:

![search setting.json](https://raw.githubusercontent.com/malekifar/wsl/main/screenshots/search%20setting.json.jpg)

The `settings.json` file with all the non-default VS Code settings will open:

![setting.json](https://raw.githubusercontent.com/malekifar/wsl/main/screenshots/setting.json.jpg)

You can use these additional settings:
```
"editor.wordSeparators": "`~!@#$%^&*()=+[{]}\\|;:'\",.<>/?",
"editor.renderWhitespace": "all",
"diffEditor.ignoreTrimWhitespace": false,
"update.mode": "none",
"extensions.autoUpdate": false,
"window.title": "[${folderName}]${separator}${dirty}${activeEditorShort}${separator}${appName}",
"files.trimTrailingWhitespace": true,
"editor.tabSize": 2
```
- `editor.wordSeparators`: I removed the — from the word separators so I can select identifiers with a — in it via double-click on a word (sometimes these can be used in bash scripts)
- `editor.renderWhitespace`: I always want to see all the spaces in my source files
- `diffEditor.ignoreTrimWhitespace` : when I do a git merge, I want to see the differences due to space changes
- `update.mode` and `extensions.autoUpdate`: I don’t want the extensions to autoupdate, I need to control when they are updated as sometimes with WSL they break
- `window.title` : I added the [foldername] to the beginning of the window title, so I can recognize different go projects instances by their folder names (I can have 5 or 6 open at the same time, this is a saviour!)
- `files.trimTrailingWhitespace` : when a file is saved, all the extra spaces at the end of a line are trimmed out
- `editor.tabSize`: I like to use 2 spaces for tabs

Add the ones you want to use to your settings.json file and save it:

![addedsetting.json](https://raw.githubusercontent.com/malekifar/wsl/main/screenshots/addedsetting.json.jpg)
### Install an extension
To install an extension, select the Install button. Once the installation is complete, the Install button will change to the Manage gear button.

![Install an extension](https://raw.githubusercontent.com/malekifar/wsl/main/screenshots/Install%20an%20extension.jpg)
### Extensions
VSCode has many extensions. You can find a list of pre-installed extensions at [here](https://marketplace.visualstudio.com)
### Best Extensions
- [vscode-icons by VSCode Icons Team](https://marketplace.visualstudio.com/items?itemName=vscode-icons-team.vscode-icons)
- [Project Manager by Alessandro Fragnani](https://marketplace.visualstudio.com/items?itemName=alefragnani.project-manager)
- [Git Graph by mhutchie](https://marketplace.visualstudio.com/items?itemName=mhutchie.git-graph)
- [Git Tree Compare by Maik Riechert](https://marketplace.visualstudio.com/items?itemName=letmaik.git-tree-compare)
- [GitLens — Git supercharged by Eric Amodio](https://marketplace.visualstudio.com/items?itemName=eamodio.gitlens)
- [Git History by Don Jayamanne](https://marketplace.visualstudio.com/items?itemName=donjayamanne.githistory)
- [Python by Microsoft](https://marketplace.visualstudio.com/items?itemName=ms-python.python)
- [Python Type Hint by njqdev](https://marketplace.visualstudio.com/items?itemName=njqdev.vscode-python-typehint)
- [Pyright by ms-pyright](https://marketplace.visualstudio.com/items?itemName=ms-pyright.pyright&ssr=false#overview)
- [Python Indent by Kevin Rose](https://marketplace.visualstudio.com/items?itemName=KevinRose.vsc-python-indent)
- [Sort lines by Daniel Imms](https://marketplace.visualstudio.com/items?itemName=Tyriar.sort-lines)
- [Sourcery by sourcery](https://marketplace.visualstudio.com/items?itemName=sourcery.sourcery)
- [Tabnine AI Code Completion by TabNine](https://marketplace.visualstudio.com/items?itemName=TabNine.tabnine-vscode&ssr=false)
- [Python Preview by dongli](https://marketplace.visualstudio.com/items?itemName=dongli.python-preview)
- [AREPL for python by Almenon](https://marketplace.visualstudio.com/items?itemName=almenon.arepl)
- [Python Test Explorer for Visual Studio Code by Little Fox Team](https://marketplace.visualstudio.com/items?itemName=LittleFoxTeam.vscode-python-test-adapter)
- [Python Docstring Generator by Nils Werner](https://marketplace.visualstudio.com/items?itemName=njpwerner.autodocstring)
- [python snippets by Ferhat Yalçın](https://marketplace.visualstudio.com/items?itemName=frhtylcn.pythonsnippets)
- [Visual Studio IntelliCode by Microsoft](https://marketplace.visualstudio.com/items?itemName=VisualStudioExptTeam.vscodeintellicode)
- [Jupyter by Microsoft](https://marketplace.visualstudio.com/items?itemName=ms-toolsai.jupyter)
- [Django by Baptiste Darthenay](https://marketplace.visualstudio.com/items?itemName=batisteo.vscode-django)
- [Code Spell Checker by Street Side Software](https://marketplace.visualstudio.com/items?itemName=streetsidesoftware.code-spell-checker)
- [Bookmarks by Alessandro Fragnani](https://marketplace.visualstudio.com/items?itemName=alefragnani.Bookmarks)
- [Better Comments by Aaron Bond](https://marketplace.visualstudio.com/items?itemName=aaron-bond.better-comments)
- [Settings Sync by Shan Khan](https://marketplace.visualstudio.com/items?itemName=Shan.code-settings-sync)
- [Peacock by John Papa](https://marketplace.visualstudio.com/items?itemName=johnpapa.vscode-peacock&ssr=false#overview)
- [Bracket Pair Colorizer 2 by CoenraadS](https://marketplace.visualstudio.com/items?itemName=CoenraadS.bracket-pair-colorizer-2)
- [Indent-Rainbow by oderwat](https://marketplace.visualstudio.com/items?itemName=oderwat.indent-rainbow)
- [Indenticator by SirTori](https://marketplace.visualstudio.com/items?itemName=SirTori.indenticator)
- [Dash by Budi Irawan](https://marketplace.visualstudio.com/items?itemName=deerawan.vscode-dash)
- [Material Theme by Equinusocio](https://marketplace.visualstudio.com/items?itemName=Equinusocio.vsc-material-theme)
- [Noctis by Liviu Schera](https://marketplace.visualstudio.com/items?itemName=liviuschera.noctis)
- [Solarized by Ryan Olson](https://marketplace.visualstudio.com/items?itemName=ryanolsonx.solarized)
- [Auto Rename Tag by Jun Han](https://marketplace.visualstudio.com/items?itemName=formulahendry.auto-rename-tag)
- [Auto Close Tag by Jun Han](https://marketplace.visualstudio.com/items?itemName=formulahendry.auto-close-tag)

## [Anaconda](https://www.anaconda.com/)
### Installing
Type the following command to download Anaconda in tmp folder and install it then press Enter:
### Silent Mode(recommended)
- For x86:
```zsh
sudo apt install curl && cd /tmp && curl https://repo.anaconda.com/archive/Anaconda3-2021.05-Linux-x86_64.sh --output anaconda.sh && bash anaconda.sh -b -p $HOME/anaconda
```
- For ARM64:
```zsh
sudo apt install curl && cd /tmp && curl https://repo.anaconda.com/archive/Anaconda3-2021.05-Linux-aarch64.sh --output anaconda.sh && bash anaconda.sh -b -p $HOME/anaconda
```
### Normally Mode
- For x86:
```zsh
sudo apt install curl && cd /tmp && curl https://repo.anaconda.com/archive/Anaconda3-2021.05-Linux-x86_64.sh --output anaconda.sh && bash anaconda.sh
```
- For ARM64:
```zsh
sudo apt install curl && cd /tmp && curl https://repo.anaconda.com/archive/Anaconda3-2021.05-Linux-aarch64.sh --output anaconda.sh && bash anaconda.sh
```
You’ll receive these following outputs in normally mode:

> Output:
> 
> Welcome to Anaconda3 2021.05
>
> In order to continue the installation process, please review the license agreement\
> Please, press ENTER to continue

Press <kbd>Enter</kbd> to continue and then press <kbd>Enter</kbd> to read through the license. Once you’re done reading the license, you’ll be prompted to approve the license terms:

> Output:
> 
> Do you approve the license terms? [yes|no]

As long as you agree, type `yes`.

> Output:
> 
> Anaconda3 will now be installed into this location:\
> /home/usename/anaconda3
> 
>   - Press ENTER to confirm the location
>   - Press CTRL-C to abort the installation
>   - Or specify a different location below
> 
> [/home/username/anaconda3] >>> 

At this point, you’ll be prompted to choose the location of the installation. You can press <kbd>Enter</kbd> to accept the default location, or specify a different location to modify it.

> output:
> 
> Preparing transaction: done\
> Executing transaction: done\
> installation finished.\
> Do you wish the installer to initialize Anaconda3\
> by running conda init? [yes|no]\
> [no] >>> 

Type `yes` so that you can initialize Anaconda3. You’ll receive some output that states changes made in various directories. One of the lines you receive will thank you for installing Anaconda.

> Output:
> 
> Thank you for installing Anaconda3!

### Conda init
```zsh
source ~/anaconda3/etc/profile.d/conda.sh ; source ~/anaconda/etc/profile.d/conda.sh ; conda init bash 
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
chsh -s $(which zsh) ; sudo sed -i 's/\/usr\/bin\/bash/\/usr\/bin\/zsh/g' /ect/passwd ; sudo sed -i 's/\/bin\/bash/\/bin\/zsh/g' /ect/passwd ; reboot
```
Open a new terminal and the initial zsh prompt will show up, signaling that zsh is now the default shell. At this point pick <kbd>2</kbd> — it will populate the zsh configuration file `~/.zshrc` with defaults.

Let’s check again that zsh is the default shell:
> output:
> 
> /usr/bin/zsh\
> zsh 5.8 (x86_64-ubuntu-linux-gnu)

### Installing [oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh)
Now we can install oh-my-zsh

```zsh
sudo apt install curl && sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

Notice that oh-my-zsh updated your `~/.bashrc` file and made a backup of the old one. Also notice that the prompt changed now, it is just your username.

OK, we are readty to customize oh-my-zsh next.
### Conda init
```zsh
source ~/anaconda3/etc/profile.d/conda.sh ; source ~/anaconda/etc/profile.d/conda.sh ; conda init zsh
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
###### [git](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/git), [docker](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/docker), [colored-man-pages](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/colored-man-pages), [colorize](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/colorize), [dash](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/dash) & [command-not-found](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/command-not-found), [extract](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/extract)
```zsh
sed -i 's/plugins=\(.*\)/plugins=\(git docker zsh-completions colored-man-pages fast-syntax-highlighting colorize dash command-not-found extract\)/g' ~/.zshrc
```
### ZSH Fonts
```zsh
cd /tmp && wget https://github.com/malekifar/ubuntu/releases/download/v1.0/Fonts.zip -O Fonts.zip && unzip Fonts.zip && sudo bash install.sh
```
### Color Schemes
```zsh
sudo apt-get install dconf-cli uuid-runtime && bash -c "$(wget -qO- https://git.io/vQgMr)"
```
Type `ALL` to installing all color schemes. You can change color scheme by changing profile in terminal.
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
- Configuring
To run Powerlevel10k configuration wizard again, type the following commands:
```zsh
p10k configure
```
![powerlevel10k](https://raw.githubusercontent.com/malekifar/ubuntu/main/Screenshots/powerlevel10k.png)
###### Agnoster
- Enabling
```zsh
sed -i 's/ZSH_THEME=".*"/ZSH_THEME="agnoster"/g' ~/.zshrc
```
- Hiding computer name
```zsh
echo "export DEFAULT_USER=$(whoami)" >> ~/.zshrc
```
![Agnoster](https://raw.githubusercontent.com/malekifar/ubuntu/main/Screenshots/agnoster.png)
###### robbyrussell
```zsh
sed -i 's/ZSH_THEME=".*"/ZSH_THEME="robbyrussell"/g' ~/.zshrc
```
![robbyrussell](https://raw.githubusercontent.com/malekifar/ubuntu/main/Screenshots/robbyrussell.png)
