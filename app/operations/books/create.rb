# frozen_string_literal: true

module Bookshelf
  module Operations
    module Books
      class Create < Bookshelf::Operation
        include Deps["persistence.rom"]

        def call(params, **)
          book = rom.relations[:books].changeset(:create, params).commit
          Success(book)
        rescue => e
          Failure(e)
        end
      end
    end
  end
end
