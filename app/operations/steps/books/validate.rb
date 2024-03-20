# frozen_string_literal: true

module Bookshelf
  module Operations
    module Steps
      module Books
        class Validate < Bookshelf::Operations::Step
          contract do
            params do
              required(:title).filled(:string, min_size?: 2)
              required(:author).filled(:string, min_size?: 2)
            end

            rule :author do
              key.failure("must start with a capital letter") unless /\A[A-Z].*/.match?(value)
            end
          end

          def call(input)
            result = contract.call(input)
            result.success? ? Success(input) : Failure(invalid: result)
          end
        end
      end
    end
  end
end
