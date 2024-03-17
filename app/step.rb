# auto_register: false
# frozen_string_literal: true

require "dry/monads"
require "dry/schema"

Dry::Schema.load_extensions(:monads, :hints)

module Bookshelf
  class Step
    include Dry::Monads[:result]
  end
end
