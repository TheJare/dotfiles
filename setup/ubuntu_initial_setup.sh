PYTHONVER=3.13

sudo apt update && sudo apt upgrade -y
sudo apt install zsh tmux zip unzip curl img2pdf -y

sudo add-apt-repository ppa:git-core/ppa
sudo apt update
sudo apt install git -y

sudo add-apt-repository ppa:deadsnakes/ppa
sudo apt update
sudo apt install python$PYTHONVER python$PYTHONVER.venv -y
mkdir ~/.venv
python$PYTHONVER -m venv ~/.venv/default

sudo add-apt-repository ppa:neovim-ppa/stable -y
sudo apt update
sudo apt install neovim -y

chsh -s $(which zsh)

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "source ~/.venv/default/bin/activate" >> ~/.bashrc
echo "source ~/.venv/default/bin/activate" >> ~/.zshrc
echo "alias nv=nvim" >> ~/.zshrc

sed -i 's/^ZSH_THEME=.*$/ZSH_THEME="eastwood"/g' ~/.zshrc
sed -i 's/^plugins=.*$/plugins=( git z )/g' ~/.zshrc
