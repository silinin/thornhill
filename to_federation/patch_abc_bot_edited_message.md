# Patch: Fix edited_message crash in ABC-bot

**Date:** 2026-01-05
**Priority:** high
**Bug:** `edited_message: 'NoneType' object has no attribute 'text'`

## Problem

When user edits their message, Telegram sends `update.edited_message` instead of `update.message`. Current handler accesses `update.message.text` which crashes with NoneType error.

## Solution

Add filter to ignore edited messages:

```python
# File: /var/ABC-Assistant/src/bot.py
# Line: ~175 (in main())

# BEFORE:
application.add_handler(MessageHandler(filters.TEXT & ~filters.COMMAND, handle_message))

# AFTER:
application.add_handler(MessageHandler(
    filters.TEXT & ~filters.COMMAND & ~filters.UpdateType.EDITED_MESSAGE,
    handle_message
))
```

## Alternative (handle edited messages)

If we want to process edited messages too:

```python
async def handle_message(update: Update, context: ContextTypes.DEFAULT_TYPE):
    """Handle text messages - Telegram wrapper"""
    telegram_id = str(update.effective_user.id)

    # Support both regular and edited messages
    message = update.message or update.edited_message
    if not message or not message.text:
        return

    user_message = message.text
    # ... rest of handler
```

## Testing

1. Start session with /start
2. Send message
3. Edit that message
4. Bot should NOT crash

## Files affected

- `/var/ABC-Assistant/src/bot.py`
