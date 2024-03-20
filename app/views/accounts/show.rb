# frozen_string_literal: true

module Bookshelf
  module Views
    module Accounts
      class Show < Bookshelf::View
        include Deps["repositories.account_repo"]

        expose :account do |identifier:|
          account_repo.by_identifier(identifier)
        end
      end
    end
  end
end
