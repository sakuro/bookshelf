# frozen_string_literal: true

module Bookshelf
  module Views
    module Books
      class Index < Bookshelf::View
        include Deps["repositories.book_repo"]

        expose :books do |page:, per_page:|
          book_repo.index_page(page:, per_page:)
        end
      end
    end
  end
end
