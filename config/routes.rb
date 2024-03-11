# frozen_string_literal: true

module Bookshelf
  class Routes < Hanami::Routes
    root to: "home.show"
    get "/home/:id", to: "home.show"
  end
end
