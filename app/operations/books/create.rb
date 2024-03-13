# frozen_string_literal: true

module Bookshelf
  module Operations
    module Books
      class Create < Bookshelf::Operation
        include Deps["repositories.book_repo"]

        def call(params, **)
          book = book_repo.create(params)
          Success(book)
        rescue => e
          Failure(e)
        end
      end
    end
  end
end
