# frozen_string_literal: true

module Bookshelf
  module Persistence
    module Relations
      class Accounts < ROM::Relation[:sql]
        schema(:accounts, infer: true) do
          associations do
            has_many :credentials
          end
        end

        def with_credentials
          join(credentials)
        end
      end
    end
  end
end
