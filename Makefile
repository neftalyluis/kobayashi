.DEFAULT_GOAL := help
.PHONY: help

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

install: ## [development] Install Application
	bin/setup

start:  ## [development] Start application
	bundle exec rails s -p 7000

routes: ## [development] Run rails routes
	bundle exec rails routes

console: ## [development] Calls the Rails console on the API instance
	bundle exec rails console

db-setup: ## [db] Setup de data base for development
	bundle exec rails db:setup

db-create: ## [db] Create the data base for development
	bundle exec rails db:create

db-migrate: ## [db] Run data base migrations for development
	bundle exec rails db:migrate

db-seed: ## [db] Insert data for development
	bundle exec rails db:seed

db-reset: ## [db] Reset the database to the default status for development
	bundle exec rails db:reset

db-drop: ## [db] Drop the data base for development
	bundle exec rails db:drop

test: ## [tests] Run tests
	bundle exec rspec ${file}

test-migrate: ## [tests] Migrates the test database
	bundle exec rails db:migrate RAILS_ENV=test

rubocop: ## [ci] Runs rubocop
	bundle exec rubocop

rubocop-fix: ## [ci] Runs rubocop with auto-fix
	bundle exec rubocop -a

brakeman:  ## [security] Run brakeman
	bundle exec brakeman -o output.html