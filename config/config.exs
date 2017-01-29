use Mix.Config
config :jbot, api_key: System.get_env("JBOT_API_KEY")
config :jirex,
  jira_api_key: "YWRtaW46MXcycTNyNGVheHN6IUAjPw==",
  jira_api_url: "https://waassi.atlassian.net/rest/api/2"
