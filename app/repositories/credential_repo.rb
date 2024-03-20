# frozen_string_literal: true

module Bookshelf
  module Repositories
    class CredentialRepo < Bookshelf::Repository[:credentials]
      commands :create, update: :by_pk, delete: :by_pk

      def by_id(id)
        credentials.by_pk(id).one!
      end

      def by_account_id_and_type(account_id, type)
        credentials.where(account_id:, type:).one!
      end
    end
  end
end
