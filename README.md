# Пример инфраструктур web приложения на docker + docker-compose

---

## 1е окружение - dev
- mysql
- nginx
- php
- php-clone с запщенной командой в foreground

### Как собрать

1. открыть терминал в папке с проектом и ввести в консоли следующие команды
2. make init-env-dev
3. make build
4. make up

---

## 2е окружение - prod
- nginx
- php
- php-clone с запщенной командой в foreground

### Как собрать

1. открыть терминал в папке с проектом и ввести в консоли следующие команды
2. make init-env-prod
3. make build
4. make up
