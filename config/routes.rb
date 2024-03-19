# frozen_string_literal: true

module Bookshelf
  class Routes < Hanami::Routes
    root to: "home.show"
    get "/home/:id", to: "home.show"
    get "/books", to: "books.index", as: :list_books
    get "/books/:id", to: "books.show", as: :show_book
    get "/books/new", to: "books.new"
    post "/books", to: "books.create", as: :create_book
  end
end
