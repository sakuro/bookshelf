# frozen_string_literal: true

module Bookshelf
  module Persistence
    module Relations
      class Credentials < ROM::Relation[:sql]
        schema(:credentials, infer: true) do
          attribute :data,
            ROM::SQL::Postgres::Types::JSONB,
            read: ROM::SQL::Postgres::Types::JSONB.constructor(->(value) { Types::RecursivelySymbolizeKeys[value.to_h] })
          associations do
            belongs_to :account
          end
        end
      end
    end
  end
end
