# frozen_string_literal: true

module Bookshelf
  module Steps
    module Users
      class Validate < Bookshelf::Step
        def call(input)
          Success(input)
        end
      end
    end
  end
end
