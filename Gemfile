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

gem "pg", "~> 1.5"
gem "rom", "~> 5.3"
gem "rom-sql", "~> 3.6"

# This silences warning from rack 2
gem "base64"

gem "bcrypt", "~> 3.1"
gem "dry-transaction", "~> 0.16.0"

group :cli, :development, :production, :test do
  # gem "cerise-gettext", github: "sakuro/cerise-gettext"
  gem "cerise-gettext", path: "../cerise-gettext"
  # gem "cerise-persistence", github: "sakuro/cerise-persistence"
  gem "cerise-persistence", path: "../cerise-persistence"
end

group :development do
  gem "foreman", "~> 0.87.2"
  gem "guard-puma"
  gem "hanami-webconsole", "~> 2.1"

  gem "rubocop", "~> 1.62"
  gem "rubocop-performance", "~> 1.20"
  gem "rubocop-rake", "~> 0.6.0"
  gem "rubocop-rspec", "~> 2.27"

  gem "debug", "~> 1.9"
  gem "repl_type_completor", "~> 0.1.0"
  gem "ruby-lsp", "~> 0.14.5"
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

group :test do
  gem "capybara"
  gem "database_cleaner-sequel"
  gem "rack-test"
  gem "rack_session_access", "~> 0.2.0"
  gem "rom-factory", "~> 0.12.0"
end

group :cli do
  gem "cerise-rubocop", path: "../cerise-rubocop"
end
