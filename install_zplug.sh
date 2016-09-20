curl -sL zplug.sh/installer | zsh
echo "source ~/.zplug/zplug" > ~/.zshrc
echo 'zplug "sorin-ionescu/prezto"' > ~/.zshrc
ln -s $HOME/.zplug/repos/sorin-ionescu/prezto ~/.zprezto
echo "restart zsh."
