# frozen_string_literal: true

module Bookshelf
  module Views
    module Books
      class Show < Bookshelf::View
        include Deps["repositories.book_repo"]

        expose :book do |id:|
          book_repo.by_id(id)
        end
      end
    end
  end
end
