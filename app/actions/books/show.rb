# frozen_string_literal: true

module Bookshelf
  module Actions
    module Books
      class Show < Bookshelf::Action
        params do
          required(:id).value(:integer)
        end

        def handle(request, response)
          response.render(
            view,
            id: request.params[:id]
          )
        end
      end
    end
  end
end
