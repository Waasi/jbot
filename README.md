# Jbot

Jbot is a custom user bot for Jira management.
Delegate issue creation, search and more to jbot
and jbot won't let you down.

### Deployment

- `mix deps.get`
- `export JBOT_API_KEY=<slack_api_key_here>`
- `mix run --no-halt`

### Jbot Commands

All jbot commands must be formatted: `@jbot <message>`
If no message is sent, jbot will reply with: `You called my lord?`

Messages:

- `Hello` or `Hey` or `Hi` or `Good morning` or `Good evening` or `Good night` => `Hey, @you`

### Special thanks to:

- @rezolvetech and @elbuo8 for the inspiration (botsito)
- @BlakeWilliams for the great ElixirSlack Client



