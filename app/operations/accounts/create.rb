# frozen_string_literal: true

module Bookshelf
  module Operations
    module Accounts
      class Create < Bookshelf::Operation
        step :validate, with: "operations.steps.accounts.validate"
        step :create, with: "operations.steps.accounts.create"
      end
    end
  end
end
