# frozen_string_literal: true

module Bookshelf
  module Operations
    module Books
      class Create < Bookshelf::Operation
        step :validate, with: "steps.users.validate"
        step :create, with: "steps.users.create"
      end
    end
  end
end
