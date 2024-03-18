# frozen_string_literal: true

require "hanami"

require "locale/middleware"

module Bookshelf
  class App < Hanami::App
    config.actions.sessions = :cookie, {
      expire_after: 60 * 60 * 24 * 365, # 1 year
      key: "bookshelf.session",
      same_site: "Lax",
      secret: settings.session_secret
    }

    config.middleware.use Locale::Middleware
  end
end
