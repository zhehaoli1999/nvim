# install newest nodejs
sudo apt install -y curl 
curl -sL https://deb.nodesource.com/setup_18.x | sudo -E bash - 

sudo apt install -y nodejs 

# install newest neovim 
sudo snap install nvim --classic

# remember to add this to .ssh/config to use github with proxy 
# Host github.com
    # HostName ssh.github.com
    # User git
    # Port 443

# add missing icons for nvimtree
#wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.3.3/NerdFontsSymbolsOnly.zip
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.3.3/JetBrainsMono.zip
sudo apt install font-manager

# install newest clangd for coc.nvim
# You can use :CocCommand workspace.showOutput to show the output
