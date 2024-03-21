# frozen_string_literal: true

require "dry-transformer"

module Bookshelf
  module Persistence
    module Relations
      class Credentials < ROM::Relation[:sql]
        module T
          extend Dry::Transformer::Registry

          import :deep_symbolize_keys, from: Dry::Transformer::HashTransformations
        end

        schema(:credentials, infer: true) do
          attribute :data,
            ROM::SQL::Postgres::Types::JSONB,
            read: ROM::SQL::Postgres::Types::JSONB.constructor(:to_h.to_proc >> T[:deep_symbolize_keys])
          associations do
            belongs_to :account
          end
        end
      end
    end
  end
end
