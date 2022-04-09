# !/bin/bash

echo "Update System"

sudo apt-get update -y && sudo apt-get upgrade -y

echo "Installing curl git and wget"
sudo apt install curl unzip wget terminator -y
sudo update-alternatives --config x-terminal-emulator
echo "Done"

echo "Download source of the vscode"
wget 'https://az764295.vo.msecnd.net/stable/f80445acd5a3dadef24aa209168452a3d97cc326/code_1.64.2-1644445741_amd64.deb' -O code.deb
echo "Done"

echo "Installing vscode"
sudo dpkg -i code.deb
echo "Done"

echo "Download and install nvm"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
echo "Done"

echo "Installing docker and docker-compose "
sudo apt install docker docker-compose -y
sudo groupadd docker
sudo usermod -aG docker $USER
echo "Done"

echo "Installing zsh"
sudo apt install zsh -y
whereis zsh
sudo usermod -s /usr/bin/zsh $(whoami)
echo "Done"

echo "# Installed by VGomes Scripts" >> ~/.zshrc

echo "Instaling theme zsh Oh my zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"


echo "Instaling spaceship theme"
sudo git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt"
sudo ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"

sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="spaceship"/g' ~/.zshrc

echo '
SPACESHIP_PROMPT_ORDER=(
  user          # Username section
  dir           # Current directory section
  host          # Hostname section
  git           # Git section (git_branch + git_status)
  hg            # Mercurial section (hg_branch  + hg_status)
  exec_time     # Execution time
  line_sep      # Line break
  vi_mode       # Vi-mode indicator
  jobs          # Background jobs indicator
  exit_code     # Exit code section
  char          # Prompt character
)
SPACESHIP_USER_SHOW=always
SPACESHIP_PROMPT_ADD_NEWLINE=false
SPACESHIP_CHAR_SYMBOL="❯"
SPACESHIP_CHAR_SUFFIX=" "' >> ~/.zshrc

sed -i 's/plugins=(git)/plugins=(git nvm)/g' ~/.zshrc

echo "installing plugins for zsh"

sh -c "$(curl -fsSL https://git.io/zinit-install)"

echo '
zinit light zdharma-continuum/fast-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions
' >> ~/.zshrc
echo 'Done'

echo "Download Fonts"

wget -c 'https://download-cdn.jetbrains.com/fonts/JetBrainsMono-2.242.zip?_gl=1*gueijs*_ga*MTE4NjkwOTAzNi4xNjQ1Njk5ODk1*_ga_V0XZL7QHEB*MTY0NTY5OTg5NC4xLjAuMTY0NTY5OTg5NC4w&_ga=2.62367468.1582626758.1645699895-1186909036.1645699895' -O font.zip
unzip font.zip
sudo cp fonts/ttf/*.ttf ~/.local/share/fonts/

echo "Done"

echo "Update MaxWatcher file"
echo fs.inotify.max_user_watches=524288 | sudo tee -a /etc/sysctl.conf && sudo sysctl -p
echo "done"

echo "Install dbeaver"
wget https://download.dbeaver.com/community/22.0.2/dbeaver-ce_22.0.2_amd64.deb
sudo dpkg -i dbeaver*
echo "Done"

echo "Install Discord"
wget https://dl.discordapp.net/apps/linux/0.0.17/discord-0.0.17.deb
sudo dpkg -i discord*
echo "Done"

echo "Install postman"
wget https://dl.pstmn.io/download/latest/linux64 postman.tar.gz
tar -xzf postman*
sudo mkdir -p /opt/apps
sudo mv Postman /opt/apps
sudo ln -s /opt/apps/Postman/Postman /usr/local/bin/postman
touch postman.desktop
echo "Create new Entry"
echo "
[Desktop Entry]
Type=Application
Name=Postman
Icon=/opt/apps/Postman/app/resources/app/assets/icon.png
Exec="/opt/apps/Postman/Postman"
Comment=Postman Desktop App
Categories=Development;Code;" >> postman.desktop
sudo mv postman.desktop /usr/share/application/postman.desktop
echo "Done"