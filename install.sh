#!/bin/bash

# Проверка, является ли скрипт запускаемым от имени суперпользователя
if [ "$(id -u)" -ne 0 ]; then
    echo "Пожалуйста, выполните скрипт с правами суперпользователя (sudo)."
    exit 1
fi

# Устанавливаем необходимые пакеты
echo "Устанавливаем Zsh, Git и необходимые инструменты..."
sudo apt update
sudo apt install -y zsh git curl

# Установка Oh My Zsh
echo "Устанавливаем Oh My Zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Скачиваем конфиги с GitHub
echo "Скачиваем конфиги Zsh..."
git clone https://github.com/sse-evn/zsh-conf.git ~/zsh-config

# Копируем конфиги в домашнюю директорию
echo "Копируем конфиги..."
cp ~/zsh-config/.zshrc ~/
cp -r ~/zsh-config/.oh-my-zsh ~/
cp ~/zsh-config/.p10k.zsh ~/

# Устанавливаем плагины
echo "Устанавливаем плагины..."
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

# Перезагружаем Zsh
echo "Перезагружаем Zsh..."
source ~/.zshrc

echo "Установка завершена! Перезапустите терминал или выполните 'source ~/.zshrc' для применения изменений."
