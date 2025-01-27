#!/bin/bash

# Проверка, является ли скрипт запускаемым от имени суперпользователя
if [ "$(id -u)" -ne 0 ]; then
    echo "Пожалуйста, выполните скрипт с правами суперпользователя (sudo)."
    exit 1
fi

# Устанавливаем необходимые пакеты
echo "Устанавливаем Zsh, Git, htop и необходимые инструменты..."
sudo apt update
sudo apt install -y zsh git htop curl

# Создаем директорию для конфигов, если она еще не существует
mkdir -p ~/.config/htop

# Устанавливаем кастомный конфиг htop
echo "Устанавливаем кастомный конфиг htop..."

# Создаем файл конфигурации htop
cat <<EOL > ~/.config/htop/htoprc
# Настройки отображения в htop
title_fqdn="off"
kernel_shorthand="on"
distro_shorthand="on"
os_arch="off"
uptime_shorthand="off"
memory_percent="off"
memory_unit="mib"
package_managers="on"
shell_path="off"
shell_version="on"
cpu_brand="on"
cpu_speed="on"
cpu_cores="logical"
cpu_temp="off"
gpu_type="all"
refresh_rate="on"
gtk_shorthand="on"
gtk2="on"
gtk3="on"
public_ip_host="http://ident.me"
public_ip_timeout=2
de_version="on"
disk_subtitle="dir"
disk_percent="on"
music_player="auto"
song_format="%artist% - %title%"
mpc_args=()
colors=(distro)
underline_enabled="on"
underline_char="¨"
separator="›"
color_blocks="on"
block_width=3
block_height=1
col_offset="auto"
bar_char_elapsed="-"
bar_char_total="="
bar_border="on"
bar_length=15
bar_color_elapsed="distro"
bar_color_total="distro"
cpu_display="off"
memory_display="off"
battery_display="off"
disk_display="off"
image_source="auto"
ascii_distro="parrot"
ascii_bold="on"
image_loop="off"
thumbnail_dir="${XDG_CACHE_HOME:-${HOME}/.cache}/thumbnails/neofetch"
crop_mode="normal"
crop_offset="center"
image_size="auto"
gap=3
yoffset=0
xoffset=0
background_color=
stdout="off"
EOL

# Установка Oh My Zsh
echo "Устанавливаем Oh My Zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Скачиваем конфиги с GitHub для Zsh
echo "Скачиваем конфиги Zsh..."
git clone https://github.com/sse-evn/zsh-conf.git ~/zsh-config

# Копируем конфиги в домашнюю директорию
echo "Копируем конфиги..."
cp ~/zsh-config/.zshrc ~/
cp -r ~/zsh-config/.oh-my-zsh ~/
cp ~/zsh-config/.p10k.zsh ~/

# Устанавливаем плагины для Zsh
echo "Устанавливаем плагины для Zsh..."
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

# Перезагружаем Zsh
echo "Перезагружаем Zsh..."
source ~/.zshrc

# Перезагружаем htop
echo "Перезагружаем htop для применения изменений..."
htop

echo "Установка и настройка завершены! Терминал и htop настроены!"
