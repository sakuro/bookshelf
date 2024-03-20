# frozen_string_literal: true

module Bookshelf
  module Operations
    module Steps
      module Sessions
        class Validate < Bookshelf::Operations::Step
          contract do
            params do
              required(:identifier).filled(:string)
              required(:password).filled(:string)
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
