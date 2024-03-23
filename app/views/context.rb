# auto_register: false
# frozen_string_literal: true

module Bookshelf
  module Views
    class Context < Hanami::View::Context
      include Deps["repositories.account_repo"]

      decorate :current_account, as: :account

      def current_path
        request.fullpath
      end

      def current_path?(path)
        current_path == path
      end

      def current_account
        @current_account ||= begin
          account_id = session[:account_id]
          account_id && account_repo.by_id(account_id)
        end
      end

      def current_account?
        !current_account.nil?
      end
    end
  end
end
