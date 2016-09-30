cd ~
git clone https://github.com/b4b4r07/zplug ~/.zplug
echo "source ~/.zplug/init.zsh" > ~/.zshrc
echo 'zplug "sorin-ionescu/prezto"' >> ~/.zshrc
ln -s ~/.zplug/repos/sorin-ionescu/prezto ~/.zprezto
echo "restart zsh."
