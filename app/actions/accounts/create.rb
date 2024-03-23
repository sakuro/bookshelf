# frozen_string_literal: true

module Bookshelf
  module Actions
    module Accounts
      class Create < Bookshelf::Action
        include Deps[create_account: "operations.accounts.create"]

        params do
          required(:account).hash do
            required(:identifier)
            required(:password)
            required(:password_confirmation)
          end
        end

        def handle(request, response)
          halt 400 unless request.params.valid?

          result = create_account.call(request.params[:account])
          case result
          in Success(account)
            response.session[:account_id] = account.id
            response.flash[:notice] = _("Account %<identifier>s has been created.") % {identifier: account.identifier}
            response.redirect_to routes.path(:show_account, identifier: account.identifier)
          in Failure(Dry::Validation::Result => result)
            response.flash.now[:alert] = _("Could not create an account.")
            response.render(view, result:)
          end
        end
      end
    end
  end
end
