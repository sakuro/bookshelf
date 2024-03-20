# auto_register: false
# frozen_string_literal: true

require "dry/monads"
require "dry/schema"

Dry::Schema.load_extensions(:monads)

module Bookshelf
  module Operations
    class Step
      include Dry::Monads[:result]

      module ClassMethods
        def contract(&)
          const_set(:Contract, Class.new(Dry::Validation::Contract, &))
        end
      end

      def self.inherited(klass)
        super
        klass.extend(ClassMethods)
      end

      def contract
        self.class::Contract.new
      end
    end
  end
end
