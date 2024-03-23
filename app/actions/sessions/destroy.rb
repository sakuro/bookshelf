# frozen_string_literal: true

module Bookshelf
  module Actions
    module Sessions
      class Destroy < Bookshelf::Action
        def handle(_request, response)
          response.session[:account_id] = nil
          response.flash[:notice] = _("Signed out")
          response.redirect_to routes.path(:root)
        end
      end
    end
  end
end
