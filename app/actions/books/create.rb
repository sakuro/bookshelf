# frozen_string_literal: true

module Bookshelf
  module Actions
    module Books
      class Create < Bookshelf::Action
        include Deps[create_book: "operations.books.create"]

        params do
          required(:book).hash do
            required(:title).filled(:string)
            required(:author).filled(:string)
          end
        end

        def handle(request, response)
          if request.params.valid?
            result = create_book.call(request.params[:book])
            case result
            in Success(book)
              response.flash[:notice] = "Book created"
              response.redirect_to routes.path(:show_book, id: book[:id])
            in Failure(e)
              response.flash.now[:alert] = "Could not create book"
            end
          else
            response.flash.now[:alert] = "Could not create book"
          end
        end
      end
    end
  end
end
