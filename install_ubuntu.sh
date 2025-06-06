# install newest nodejs
sudo apt update
sudo apt install -y curl 

curl -sL https://deb.nodesource.com/setup_20.x | sudo -E bash -

#curl -fsSL https://deb.nodesource.com/gpgkey/nodesource.gpg.key | sudo gpg --dearmor -o /usr/share/keyrings/nodesource-archive-keyring.gpg
#echo "deb [signed-by=/usr/share/keyrings/nodesource-archive-keyring.gpg] https://deb.nodesource.com/node_18.x $(lsb_release -cs) main" > /etc/apt/sources.list.d/nodesource.list
#echo "deb-src [signed-by=/usr/share/keyrings/nodesource-archive-keyring.gpg] https://deb.nodesource.com/node_18.x $(lsb_release -cs) main" >> /etc/apt/sources.list.d/nodesource.list

#sudo apt-get update
sudo apt install -y nodejs
sudp apt install -y npm

# install newest neovim 
sudo snap install nvim --classic

# remember to add this to .ssh/config to use github with proxy 
# Host github.com
    # HostName ssh.github.com
    # User git
    # Port 443

# add missing icons for nvimtree
#wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.3.3/NerdFontsSymbolsOnly.zip
#wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.3.3/JetBrainsMono.zip
sudo apt install -y font-manager

# install newest clangd for coc.nvim
# You can use :CocCommand workspace.showOutput to show the output

# install ctags for plugin 
sudo apt install -y exuberant-ctags

# for sogou input 
sudo apt install -y libgsettings-qt1
sudo apt install -y libqt5quickwidgets5

# For coc to work for C++ and python 
# :CocInstall coc-pyright coc-clangd

# for telescope live-grep 
sudo apt install -y fd-find
sudo apt install -y ripgrep

# Install fish-shell
sudo apt-get install -y fish
sudo sh -c 'echo /usr/bin/fish >> /etc/shells'
chsh -s /usr/bin/fish

# install htop 
sudo apt install -y htop

# if clangd cannot recognize C++ stanford headers, try:
# sudo apt install libstdc++-12-dev
# Ref: https://stackoverflow.com/questions/26333823/clang-doesnt-see-basic-headers/29821538#29821538:~:text=sudo%20apt%20install%20libstdc%2B%2B%2D12%2Ddev
