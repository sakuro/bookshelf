# frozen_string_literal: true

module Bookshelf
  module Operations
    module Steps
      module Sessions
        class Authenticate < Bookshelf::Operations::Step
          include Deps["repositories.account_repo"]

          def call(input)
            account = account_repo.by_identifier_with_credentials(input[:identifier])
            if find_matching_credential(account.credentials, input[:password])
              Success(account)
            else
              Failure(:not_found)
            end
          rescue => e
            Failure(e)
          end

          private def find_matching_credential(credentials, password)
            credentials.find {|cred|
              BCrypt::Password.new(cred.data[:encrypted_password]) == password
            }
          end
        end
      end
    end
  end
end
