# frozen_string_literal: true

module Bookshelf
  module Actions
    module Books
      class Show < Bookshelf::Action
        handle_exception ROM::TupleCountMismatchError => :handle_not_found

        params do
          required(:id).value(:integer)
        end

        def handle(request, response)
          response.render(
            view,
            id: request.params[:id]
          )
        end

        private def handle_not_found(request, response, exception)
          response.status = 404
          response.format = :html
          response.body = "Not found"
        end
      end
    end
  end
end
