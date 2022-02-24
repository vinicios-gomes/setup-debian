# !/bin/bash

echo "Update System"

sudo apt-get update -y && sudo apt-get upgrade -y

echo "Installing curl git and wget"
sudo apt install curl unzip wget -y
echo "Done"

echo "Download source of the vscode"
wget 'https://az764295.vo.msecnd.net/stable/f80445acd5a3dadef24aa209168452a3d97cc326/code_1.64.2-1644445741_amd64.deb'
echo "Done"

echo "Installing vscode"
sudo dpkg -i code_1.64.2-1644445741_amd64.deb -y
echo "Done"

echo "Download and install nvm"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
echo "Done"

echo "Installing docker and docker-compose "
sudo apt install docker docker-compose -y
echo "Done"

echo "Installing zsh"
sudo apt install zsh -y
whereis zsh
sudo usermod -s /usr/bin/zsh $(whoami)
echo "Done"

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

wget 'https://download-cdn.jetbrains.com/fonts/JetBrainsMono-2.242.zip?_gl=1*gueijs*_ga*MTE4NjkwOTAzNi4xNjQ1Njk5ODk1*_ga_V0XZL7QHEB*MTY0NTY5OTg5NC4xLjAuMTY0NTY5OTg5NC4w&_ga=2.62367468.1582626758.1645699895-1186909036.1645699895'
unzip *.zip
sudo cp fonts/ttf/*.ttf ~/.local/share/fonts/

echo "Done"