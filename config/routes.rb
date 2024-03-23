# frozen_string_literal: true

module Bookshelf
  class Routes < Hanami::Routes
    root to: "home.show"

    get "/books", to: "books.index", as: :list_books
    get "/books/:id", to: "books.show", as: :show_book
    get "/books/new", to: "books.new", as: :new_book
    post "/books", to: "books.create", as: :create_book

    get "/sign_up", to: "accounts.new", as: :sign_up

    get "/sign_in", to: "sessions.new", as: :sign_in
    post "/sign_in", to: "sessions.create", as: :create_session

    get "/accounts/new", to: "accounts.new", as: :new_account
    post "/accounts", to: "accounts.create", as: :create_account
    get "/accounts/:identifier", to: "accounts.show", as: :show_account
  end
end
