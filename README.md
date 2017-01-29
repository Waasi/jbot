# Jbot

Jbot is a custom user bot for Jira management.
Delegate issue creation, search and more to jbot
and jbot won't let you down.

### Deployment
Remember to add a custom user bot to
your slack team and name it jbot to
get the slack api key.

- `mix deps.get`
- `export JBOT_API_KEY=<slack_api_key_here>`
- `mix run --no-halt`

### Make Commands

- `make build` ## Gets all dependancies
- `make run` ## Runs jbot app

### Jbot Commands

All jbot commands must be formatted: `@jbot <message>`
If no message is sent, jbot will reply with: `You called my lord?`

Messages:

- `Hello` or `Hey` or `Hi` or `Good morning` or `Good evening` or `Good night` => `Hey, @you`

### Special thanks to:

- @rezolvetech and @elbuo8 for the inspiration (botsito)
- @BlakeWilliams for the great ElixirSlack Client

## Contributing

1. Fork it ( https://github.com/[my-github-username]/jbot/fork )
2. Create your feature branch (`git checkout -b feature/my_new_feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
