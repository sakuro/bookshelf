# frozen_string_literal: true

module Bookshelf
  module Persistence
    module Relations
      class Credentials < ROM::Relation[:sql]
        schema(:credentials, infer: true) do
          associations do
            belongs_to :account
          end
        end
      end
    end
  end
end
