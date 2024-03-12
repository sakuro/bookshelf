# auto_register: false
# frozen_string_literal: true

require "dry-monads"
require "dry/schema"

Dry::Schema.load_extensions(:monads)

module Bookshelf
  class Operation
    include Dry::Monads[:result]

    def self.inherited(op)
      op.include Dry::Monads::Do.for(:call)
      super
    end

    def self.call(*, **)
      new.call(*, **)
    end
  end
end
