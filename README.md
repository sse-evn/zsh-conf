# zsh-conf
🔥 Что здесь есть?

    Oh My Zsh — управление плагинами и настройками.
    Powerlevel10k — космос, а не тема! Очень кастомизируемая и быстрая.
    Плагины:
        zsh-autosuggestions — подсказывает команды, как будто читает мысли.
        zsh-syntax-highlighting — выделяет команды, чтобы не писать фигню.
        git — удобные алиасы для работы с Git.
    Всякие алиасы и кастомные штуки, чтобы тратить меньше времени на набор команд.

🚀 Как это запустить?

    Склонируй репозиторий:

git clone git@github.com:sse-evn/zsh-conf.git
cd zsh-conf

Скопируй конфиги в домашнюю директорию:

cp .zshrc ~/
cp -r .oh-my-zsh ~/
cp .p10k.zsh ~/

Установи плагины:

git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

Перезагрузи Zsh:

source ~/.zshrc

Готово! Теперь у тебя стильный терминал 🎉.
