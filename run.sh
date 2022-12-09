echo "     _    _         _                   _____ _           _           "
echo "    / \  (_)_ __ __| |_ __ ___  _ __   |  ___(_)_ __   __| | ___ _ __ "
echo "   / _ \ | | '__/ _\` | '__/ _ \| '_ \  | |_  | | '_ \ / _\` |/ _ \ '__|"
echo "  / ___ \| | | | (_| | | | (_) | |_) | |  _| | | | | | (_| |  __/ |   "
echo " /_/   \_\_|_|  \__,_|_|  \___/| .__/  |_|   |_|_| |_|\__,_|\___|_|   "
echo "                               |_|                                    "

echo "Website  : https://www.airdropfinder.com"
echo "Telegram : https://t.me/airdropfind"
echo "Facebook : https://www.facebook.com/groups/744001332439290"
echo "Twitter  : https://twitter.com/AirdropfindX"
sleep 5

echo -e "\n==========INSTALLING DEPENDENCIES==========\n"
sleep 2

sudo apt-get update
sudo apt-get upgrade
sudo apt-get install build-essential cmake curl protobuf-compiler clang pkg-config libssl-dev git ca-certificates gnupg lsb-release -y
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source "$HOME/.cargo/env"
cargo install sccache

echo -e "\n==========INSTALLING URSA PACKAGE==========\n"
sleep 2

git clone https://github.com/fleek-network/ursa.git
cd ursa
rm Makefile
wget -q https://raw.githubusercontent.com/bayy420-999/Tutorial-testnet-Fleek-Airdrop-Finder/master/Makefile
make install
export DOCKER_BUILDKIT=1
make docker-build

echo -e "\n==========RUNNING URSA-CLI DOCKER==========\n"
sleep 2
make docker-run
