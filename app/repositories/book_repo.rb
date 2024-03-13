# frozen_string_literal: true

require "rom-repository"

module Bookshelf
  module Repositories
    class BookRepo < ROM::Repository[:books]
      include Deps[container: "persistence.rom"]

      commands :create, update: :by_pk, delete: :by_pk

      def by_id(id)
        books.by_pk(id).one!
      end

      def all
        books.to_a
      end

      def count
        books.count
      end
    end
  end
end
