set -e  # остановить выполнение при ошибке

echo "Обновление списка пакетов..."
sudo apt upgrade
sudo apt install tree

echo "Установка системных утилит..."
sudo apt install -y tree python3-pip python3-venv

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
