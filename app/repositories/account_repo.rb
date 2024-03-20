# frozen_string_literal: true

module Bookshelf
  module Repositories
    class AccountRepo < Bookshelf::Repository[:accounts]
      commands :create, update: :by_pk, delete: :by_pk

      def by_id(id)
        accounts.by_pk(id).one!
      end

      def by_identifier(identifier)
        accounts.where(identifier:).one!
      end

      def by_id_with_credentials(id)
        accounts.combine(:credentials).by_pk(id).one!
      end

      def by_identifier_with_credentials(identifier)
        accounts.combine(:credentials).where(identifier:).one!
      end

      def create_with_encrypted_password(identifier, encrypted_password, algorithm: "bcrypt")
        params = {
          identifier:,
          credentials: [{type: "password", data: {algorithm:, encrypted_password:}}]
        }
        accounts.combine(:credentials).command(:create).call(params)
      end
    end
  end
end
