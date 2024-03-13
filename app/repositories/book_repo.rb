# frozen_string_literal: true

require "rom-repository"

module Bookshelf
  module Repositories
    class BookRepo < ROM::Repository[:books]
      include Deps[container: "persistence.rom"]

      commands :create
    end
  end
end
