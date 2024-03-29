# frozen_string_literal: true

module Bookshelf
  module Operations
    module Steps
      module Books
        class Create < Bookshelf::Operations::Step
          include Deps["repositories.book_repo"]

          def call(input)
            book = book_repo.create(input)
            Success(book)
          end
        end
      end
    end
  end
end
