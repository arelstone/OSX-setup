#!/usr/bin/env bash

# Install Homebrew
ruby -e "$(curl -fsSL https://raw.zshhubusercontent.com/Homebrew/install/master/install)"
brew doctor
brew update

brew cask install visual-studio-code
brew install git

brew install node
brew install watchman
npm install -g n
npm install -g react-native-cli

open https://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html
open https://dl.google.com/dl/android/studio/install/3.4.1.0/android-studio-ide-183.5522156-mac.dmg

git config --global core.editor "nano"

# Install zsh
brew install zsh
sudo -s 'echo /usr/local/bin/zsh >> /etc/shells' && chsh -s /usr/local/bin/zsh # Set default terminal to zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" # Download oh my zsh
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/powerline/fonts.git
echo "🛀   Performing cleanup"
cd fonts && ./install.sh
cd .. && rm -rf fonts

open http://ethanschoonover.com/solarized/files/solarized.zip
cd ~/Downloads
unzip solarized.zip
echo "🛀   Performing cleanup"
rm solarized.zip

## Update ~/.zshrc file
echo "🏁🏁   Updating ~/.zshrc   🏁🏁"

cat << EOF >> ~/.zshrc
export PATH="\$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
export EDITOR=/usr/bin/nano

alias zshconfig="nano ~/.zshrc"
alias ohmyzsh="nano ~/.oh-my-zsh"

prompt_context() {
  if [[ "$USER" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then
    prompt_segment black default "%(!.%{%F{yellow}%}.)$USER"
  fi
}

export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

EOF

echo "🏁 💥 👏  🎆   All done    🎆  👏 💥 🏁"
echo "🔥 Add zsh-autosuggestions to pludis section in ~/.zshrc"
echo "🔥 Import solarized theme to terminal"
echo "🔥 Change font to Ubuntu Mono Powerline"