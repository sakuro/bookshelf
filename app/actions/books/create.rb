# frozen_string_literal: true

module Bookshelf
  module Actions
    module Books
      class Create < Bookshelf::Action
        include Deps["persistence.rom"]

        params do
          required(:book).hash do
            required(:title).filled(:string)
            required(:author).filled(:string)
          end
        end

        def handle(request, response)
          valid_params = yield valid_params(request.params)
          book = yield Bookshelf::Operations::Books::Create.call(valid_params[:book])
          response.flash[:notice] = "Book created"
          response.redirect_to routes.path(:show_book, id: book[:id])
        rescue => halt
          case halt.result
          in Failure(:invalid_params)
            puts "invalid params"
          end
          response.flash.now[:alert] = "Could not create book"
        end

        def valid_params(params)
          params.valid? ? Success(params) : Failure(:invalid_params)
        end
      end
    end
  end
end
