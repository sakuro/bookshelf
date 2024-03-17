# frozen_string_literal: true

module Bookshelf
  module Steps
    module Books
      class Validate < Bookshelf::Step
        def call(input)
          result = schema.call(input)
          result.success? ? Success(input) : Failure(invalid: result)
        end

        private def schema
          Dry::Schema.Params do
            required(:title).filled(:string, min_size?: 3)
            required(:author).filled(:string, min_size?: 3, format?: /\A[A-Z][a-z]+/)
          end
        end
      end
    end
  end
end
