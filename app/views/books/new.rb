# frozen_string_literal: true

module Bookshelf
  module Views
    module Books
      class New < Bookshelf::View
        expose(:errors) do |result: nil|
          result.nil? ? [] : result.errors.to_a
        end
      end
    end
  end
end
