# frozen_string_literal: true

module Bookshelf
  module Actions
    module Accounts
      class Show < Bookshelf::Action
        params do
          required(:identifier).value(:string)
        end

        def handle(request, response)
          halt 400 unless request.params.valid?
          response.render(
            view,
            identifier: request.params[:identifier]
          )
        end
      end
    end
  end
end
