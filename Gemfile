# frozen_string_literal: true

source "https://rubygems.org"

gem "hanami", "~> 2.1"
gem "hanami-assets", "~> 2.1"
gem "hanami-controller", "~> 2.1"
gem "hanami-router", "~> 2.1"
gem "hanami-validations", "~> 2.1"
gem "hanami-view", "~> 2.1"

gem "dry-types", "~> 1.0", ">= 1.6.1"
gem "puma"
gem "rake"

group :development do
  gem "guard-puma"
  gem "hanami-webconsole", "~> 2.1"
end

group :development, :test do
  gem "dotenv"
end

group :cli, :development do
  gem "hanami-reloader", "~> 2.1"
end

group :cli, :development, :test do
  gem "hanami-rspec", "~> 2.1"
end

gem "cerise-boilerplates", "~> 0.1.0", group: :cli, path: "/home/sakuro/github.com/sakuro/cerise-boilerplates"

gem "rubocop", "~> 1.62", group: :development
gem "rubocop-performance", "~> 1.20", group: :development
gem "rubocop-rake", "~> 0.6.0", group: :development
gem "rubocop-rspec", "~> 2.27", group: :development

gem "pg", "~> 1.5"
gem "rom", "~> 5.3"
gem "rom-sql", "~> 3.6"

gem "foreman", "~> 0.87.2", group: :development
gem "ruby-lsp", "~> 0.14.5", group: :development

gem "faker", "~> 3.2", group: :test

gem "debug", "~> 1.9", group: :development
gem "repl_type_completor", "~> 0.1.0", group: :development
gem "test", "~> 1.0", group: :development

group :test do
  gem "capybara"
  gem "rack-test"
end
