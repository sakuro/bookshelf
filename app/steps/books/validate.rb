# frozen_string_literal: true

module Bookshelf
  module Steps
    module Books
      class Validate < Bookshelf::Step
        def call(input)
          schema.call(input).to_monad
        end

        private def schema
          Dry::Schema.Params do
            required(:title).filled(:string, min_size?: 1)
            required(:author).filled(:string, min_size?: 1)
          end
        end
      end
    end
  end
end
