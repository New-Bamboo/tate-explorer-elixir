dev_setup:
	dropdb --if-exists tate-explorer-dev && createdb tate-explorer-dev && mix ecto.migrate TateExplorer.Repo
test_setup:
	dropdb --if-exists tate-explorer-test && createdb tate-explorer-test && MIX_ENV=test mix ecto.migrate TateExplorer.Repo
prod_setup:
	dropdb --if-exists tate-explorer-prod && createdb tate-explorer-prod && mix ecto.migrate TateExplorer.Repo
