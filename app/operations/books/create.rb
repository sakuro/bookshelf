# frozen_string_literal: true

module Bookshelf
  module Operations
    module Books
      class Create < Bookshelf::Operation
        include Deps["persistence.rom"]

        def call(params)
          valid_params = yield validate_params(params)
          book = yield create_book(valid_params)
          Success(book)
        end

        private def schema
          Dry::Schema.Params do
            required(:title).filled(:string)
            required(:author).filled(:string)
          end
        end

        private def validate_params(params)
          result = schema.call(params)
          result.success? ? Success(params) : Failure(result.errors)
        end

        private def create_book(params)
          book = rom.relations[:books].changeset(:create, params).commit
          Success(book)
        rescue => e
          Failure(e)
        end
      end
    end
  end
end
