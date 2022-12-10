# Tutorial testnet Fleek node Airdrop Finder

<p style="font-size:14px" align="right">
<a href="https://t.me/airdropfind" target="_blank">Join Telegram Airdrop Finder<img src="https://user-images.githubusercontent.com/50621007/183283867-56b4d69f-bc6e-4939-b00a-72aa019d1aea.png" width="30"/></a>
</p>

<p align="center">
  <img height="auto" width="auto" src="https://raw.githubusercontent.com/bayy420-999/airdropfind/main/NavIcon.png">
</p>

## Referensi

* [Registrasi Beta waitlist](https://fleek.xyz/)

* Dokumen resmi
  * [Fleek Network: Getting Started Guide](https://blog.fleek.co/posts/fleek-network-getting-started-guide)
  * [Fleek Network: How to install Rust and the dependencies for Ursa CLI](https://blog.fleek.co/posts/fleek-network-how-to-install-rust-and-the-dependencies-for-ursa-cli)
  * [Fleek Network: Running a node in a Docker container](https://blog.fleek.co/posts/fleek-network-running-a-node-in-a-docker-container)

* [Server Discord](https://discord.gg/fleekxyz)

## Spesifikasi Software & Hardware

### Persyaratan Hardware

| Komponen | Spesifikasi minimal |
|----------|---------------------|
|CPU|4 Cores|
|RAM|8 GB DDR4 RAM|
|Penyimpanan|1 TB HDD|
|Koneksi|10Mbit/s port|

| Komponen | Spesifikasi rekomendasi |
|----------|---------------------|
|CPU|32 Cores|
|RAM|32 GB DDR4 RAM|
|Penyimpanan|2 x 1 TB NVMe SSD|
|Koneksi|1 Gbit/s port|

### Persyaratan Software/OS

| Komponen | Spesifikasi minimal |
|----------|---------------------|
|Sistem Operasi|Ubuntu 16.04|

| Komponen | Spesifikasi rekomendasi |
|----------|---------------------|
|Sistem Operasi|Ubuntu 20.04|
## Setup

### Setup Otomatis

* Install `screen` dan `wget`
  ```console
  apt-get install screen wget
  ```
* Download script `run.sh`
  ```console
  rm run.sh
  wget -q https://raw.githubusercontent.com/bayy420-999/Tutorial-testnet-Fleek-Airdrop-Finder/master/run.sh
  ```
* Ubah `run.sh` menjadi executable
  ```console
  chmod +x run.sh
  ```
* Buka terminal baru dengan menggunakan `screen`
  ```console
  screen -Rd fleek
  ```
  > Setelah terminal baru terbuka, jalankan script
* Jalankan script
  ```console
  ./run.sh
  ```

### Setup Manual

* Update apt
  ```console
  sudo apt-get update
  sudo apt-get upgrade
  ```
* Instal `rust`
  ```console
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
  ```
  > Jika ada prompt langsung pencet Enter saja
* Load environment variable `rust`
  ```console
  source "$HOME/.cargo/env"
  ```
* Cek apakah `rust sudah terinstal`
  ```console
  cargo --version
  ```
  Jika `rust` sudah terinstal maka di terminal akan muncul output seperti berikut
  ```console
  cargo 1.65.0 (4bc8f24d3 2022-10-20)
  ```
* (OPSIONAL) Instal `scchace`
  ```console
  cargo install sccache
  ```
* Instal dependensi Linux
  ```console
  sudo apt-get install build-essential git curl screen cmake clang pkg-config libssl-dev protobuf-compiler
  ```
* Instal `Docker`
  ```console
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
  echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
  sudo apt-get update
  sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin
  ```
* Buka terminal baru dengan menggunakan `screen`
  ```console
  screen -Rd fleek
  ```
  > Setelah terminal baru terbuka, lanjutkan ke langkah berikutnya
* Download `Ursa-cli`
  ```console
  git clone https://github.com/fleek-network/ursa.git
  ```
* Masuk ke folder `ursa`
  ```console
  cd ursa
  ```
* Update Makefile
  ```console
  rm Makefile
  wget -q https://raw.githubusercontent.com/bayy420-999/Tutorial-testnet-Fleek-Airdrop-Finder/master/Makefile
  ```
* Instal `Ursa-cli`
  ```console
  make install
  ```
* Cek apakah `Ursa-cli` sudah terinstal
  ```console
  ursa-cli --help
  ```
* Build container `Docker`
  ```console
  make docker-build
  ```
* Jalankan container `Docker`
  ```console
  make docker-run
  ```

## Perintah berguna

## Troubleshoot
