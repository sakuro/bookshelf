# frozen_string_literal: true

module Bookshelf
  module Views
    module Parts
      class Account < Bookshelf::Views::Part
        def to_s
          nil? ? "NIL" : identifier
        end
      end
    end
  end
end
