# auto_register: false
# frozen_string_literal: true

require "dry/transaction"
require "dry/transaction/operation"

module Bookshelf
  class Operation
    include Dry::Transaction::Operation
    include Dry::Transaction(container: Bookshelf::Container)

    # Ensures that #call and #[] function identically
    def self.method_added(method_name)
      if method_name == :call && !instance_methods.include?(:[])
        alias_method :[], :call
      elsif method_name == :[] && !instance_methods.include?(:call)
        alias_method :call, :[]
      end

      super
    end
  end
end
