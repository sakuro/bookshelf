# frozen_string_literal: true

module Bookshelf
  module Actions
    module Books
      class Create < Bookshelf::Action
        include Deps[create_book: "operations.books.create"]

        params do
          required(:book).hash do
            required(:title)
            required(:author)
          end
        end

        def handle(request, response)
          halt 400 unless request.params.valid?
          case create_book.call(request.params[:book])
          in Success(book)
            response.flash[:notice] = "Book created"
            response.redirect_to routes.path(:show_book, id: book[:id])
          in Failure(invalid: result)
            response.flash.now[:alert] = "Could not create book"
            response.render(view, result:)
          in Failure(Exception => _exception)
            response.flash.now[:alert] = "Could not create book"
          end
        end
      end
    end
  end
end
