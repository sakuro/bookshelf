# frozen_string_literal: true

module Bookshelf
  module Actions
    module Sessions
      class Create < Bookshelf::Action
        include Deps[create_session: "operations.sessions.create"]

        params do
          required(:account).hash do
            required(:identifier)
            required(:password)
          end
        end

        def handle(request, response)
          halt 400 unless request.params.valid?

          result = create_session.call(request.params[:account])
          case result
          in Success(account)
            response.session[:account_id] = account.id
            response.flash[:notice] = _("Signed in")
            response.redirect_to routes.path(:show_account, identifier: account[:identifier])
          in Failure(_)
            response.flash.now[:alert] = _("Sign in failed")
          end
        end
      end
    end
  end
end
