# frozen_string_literal: true

module Bookshelf
  module Operations
    module Steps
      module Accounts
        class Validate < Bookshelf::Operations::Step
          SEPARATOR_LETTER_RE = /[-_]/
          private_constant :SEPARATOR_LETTER_RE

          IDENTIFIER_LETTER_RE = /[[:alnum:]#{SEPARATOR_LETTER_RE}]/
          private_constant :IDENTIFIER_LETTER_RE

          contract do
            params do
              required(:identifier).filled(:string, min_size?: 1)
              required(:password).filled(:string, size?: 12..50)
              required(:password_confirmation).filled(:string)
            end

            rule(:identifier) do
              unless value.ascii_only? && /\A#{IDENTIFIER_LETTER_RE}+\z/o.match?(value)
                key.failure("must use only ASCII alphabets, numbers, '-' or '_'.")
              end

              if value.start_with?(SEPARATOR_LETTER_RE) || value.match?(/#{SEPARATOR_LETTER_RE}\z/o)
                key.failure("cannot use '-' or '_' at the beginning or end.")
              end

              key.failure("cannot use consecutive '-' or '_'.") if /#{SEPARATOR_LETTER_RE}{2,}/o.match?(value)
            end

            rule(:password) do
              unless value.ascii_only? && /\A[[:print:]]+\z/o.match?(value)
                key.failure("must use only ASCII printable letters")
              end
            end

            rule(:password_confirmation, :password) do
              key.failure("mismatch") if values[:password_confirmation] != values[:password]
            end
          end

          def call(input)
            result = contract.call(input)
            result.success? ? Success(input) : Failure(result.errors)
          end
        end
      end
    end
  end
end
