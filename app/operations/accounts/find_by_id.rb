# frozen_string_literal: true

module Bookshelf
  module Operations
    module Accounts
      class FindById < Bookshelf::Operation
        step :find, with: "operations.steps.accounts.find_by_id"
      end
    end
  end
end
