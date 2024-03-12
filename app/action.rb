# auto_register: false
# frozen_string_literal: true

require "hanami/action"
require "dry/monads"

module Bookshelf
  class Action < Hanami::Action
    include Dry::Monads[:result]

    def self.inherited(action)
      action.include Dry::Monads::Do.for(:handle)
      super
    end

    handle_exception ROM::TupleCountMismatchError => :handle_not_found

    private def handle_not_found(_request, response, _exception)
      response.status = 404
      response.format = :html
      response.body = "Not found"
    end
  end
end
