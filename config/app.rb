# frozen_string_literal: true

require "hanami"

module Bookshelf
  class App < Hanami::App
    config.actions.sessions = :cookie, {
      expire_after: 60 * 60 * 24 * 365, # 1 year
      key: "bookshelf.session",
      same_site: "Lax",
      secret: settings.session_secret
    }
  end
end
