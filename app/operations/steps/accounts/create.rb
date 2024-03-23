# frozen_string_literal: true

require "bcrypt"

module Bookshelf
  module Operations
    module Steps
      module Accounts
        class Create < Bookshelf::Operations::Step
          include Deps["repositories.account_repo"]

          def call(input)
            raw_password = input[:password]
            password_digest = BCrypt::Password.create(raw_password).to_s

            account = account_repo.create_with_password_digest(input[:identifier], password_digest)
            Success(account)
          end
        end
      end
    end
  end
end
