# frozen_string_literal: true

module Bookshelf
  module Operations
    module Steps
      module Accounts
        class FindById < Bookshelf::Operations::Step
          include Deps["repositories.account_repo"]

          def call(input)
            account = account_repo.by_id(input[:id])
            Success(account)
          end
        end
      end
    end
  end
end
