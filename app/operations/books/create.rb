# frozen_string_literal: true

module Bookshelf
  module Operations
    module Books
      class Create < Bookshelf::Operation
        step :validate, with: "operations.steps.books.validate"
        step :create, with: "operations.steps.books.create"
      end
    end
  end
end
