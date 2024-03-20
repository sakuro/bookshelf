# frozen_string_literal: true

module Bookshelf
  module Actions
    module Home
      class Show < Bookshelf::Action
        include Deps[find_account_by_id: "operations.accounts.find_by_id"]

        def handle(request, response)
          id = request.session[:account_id]
          if id
            result = find_account_by_id.call(id:)
            case result
            in Success(account)
              response.redirect_to routes.path(:show_account, identifier: account.identifier)
            else
              halt 404
            end
          end
        end
      end
    end
  end
end
