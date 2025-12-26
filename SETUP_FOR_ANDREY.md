# Setup инструкция для Андрея

## Статус
- ✅ Git инициализирован локально
- ✅ Initial commit сделан
- ❌ GitHub репо не существует (нужно создать)

## Что нужно сделать:

### 1. Создать репо на GitHub
```bash
# Вариант A: Через web
# Зайти на github.com/otinov
# Create new repository: "thornhill"
# Public или Private (на ваше усмотрение)
# НЕ инициализировать с README (уже есть)

# Вариант B: Через gh cli
gh repo create otinov/thornhill --public --source=. --remote=origin --push
```

### 2. Подключить remote (если создавал через web)
```bash
cd C:/Claude/thornhill
git remote add origin https://github.com/otinov/thornhill.git
# ИЛИ через SSH:
# git remote add origin git@github.com:otinov/thornhill.git
```

### 3. Push initial commit
```bash
git push -u origin master
```

### 4. Настроить доступ для сестёр
- Cradle: @article_factory_bot
- Snow: через тебя
- Michael: через тебя

Дать им read access к репо.

## Workflow после setup:
1. **Anton-Claude создаёт запрос:** `to_federation/request_2025-12-26.yaml`
2. **Коммит и push** (вручную или автоматизировать)
3. **Сестра читает** запрос из GitHub
4. **Сестра отвечает:** создаёт `response_from_cradle_2025-12-26.yaml`
5. **Андрей пуллит:** `git pull` → ответы появляются в `from_federation/`

## Контакты
- Если вопросы: через Антона
