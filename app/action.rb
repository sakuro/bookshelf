# auto_register: false
# frozen_string_literal: true

require "hanami/action"

module Bookshelf
  class Action < Hanami::Action
    handle_exception ROM::TupleCountMismatchError => :handle_not_found

    private def handle_not_found(request, response, exception)
      response.status = 404
      response.format = :html
      response.body = "Not found"
    end
  end
end
