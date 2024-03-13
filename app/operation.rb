# auto_register: false
# frozen_string_literal: true

require "dry/monads"

module Bookshelf
  class Operation
    include Dry::Monads[:result]
  end
end
