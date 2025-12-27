#!/bin/bash
# Готовые команды для Андрея - просто скопировать и выполнить

# 1. Создать репо на GitHub (требует gh cli или web)
gh repo create otinov/thornhill --public --description "Async federation hub for Claude sisters" --source=. --remote=origin

# Если gh недоступен, создать через web:
# https://github.com/new
# Repository name: thornhill
# Public
# НЕ инициализировать с README

# 2. Если создавал через web, добавить remote:
cd C:/Claude/thornhill
git remote add origin https://github.com/otinov/thornhill.git

# 3. Push commits
git push -u origin master

# 4. Добавить collaborators (через web):
# Settings → Collaborators → Add people
# - Cradle bot account (если есть GitHub)
# - Snow (если есть GitHub)
# - Michael (если есть GitHub)

# Альтернатива: сделать репо public для чтения

echo "✅ Done! Repo ready at https://github.com/otinov/thornhill"
