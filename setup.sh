#!/bin/bash

set -e  # остановить выполнение при ошибке

cd "$(dirnamw "$0")"
echo "=== Рабочая папка: $(pwd) ==="

echo "=== apt update ==="
sudo apt update

echo "Обновление списка пакетов..."
sudo apt upgrade
sudo apt install tree

echo "Установка системных утилит..."
sudo apt install -y \
    git \
    tree \
    curl \
    python3 \
    python3-pip \
    python3-venv

echo "===  Создание venv ==="
python3 -m venv venv

echo "=== Установка python-зависимостей ==="
./venv/bin/pip install --upgrade pip
./venv/bin/pip install -r backend/requirements.txt

echo "=== Установка node.js ==="
curls fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash - &&\
sudo apt install -y nodejs

echo "=== npm install (frontend) ==="
cd taski/frontend/
npm i
cd ..

echo ""
echo "=== Готово ==="
echo "Дальше выполните вручную:"
echo "  cd $(pwd)"
echo "  source venv/bin/activate"
echo "  python backend/manage.py migrate"
echo "  python backend/manage.py runserver 0.0.0.0:8000"

echo ""
echo "=========================================="
echo "  ВАЖНО: настрой Git перед первым коммитом"
echo "=========================================="
echo "Выполни команды:"
echo ""
echo "  git config --global user.name  'Ваше Имя'"
echo "  git config --global user.email 'ваш@email'"
echo ""

echo "Готово!"
