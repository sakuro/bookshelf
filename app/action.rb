# auto_register: false
# frozen_string_literal: true

require "dry/monads"
require "gettext"

require "hanami/action"

module Bookshelf
  class Action < Hanami::Action
    include Dry::Monads[:result]
    include Deps["logger"]
    include GetText

    bindtextdomain(Hanami.app.app_name.name)

    handle_exception ROM::TupleCountMismatchError => :handle_not_found

    private def handle_not_found(_request, response, _exception)
      response.status = 404
      response.format = :html
      response.body = "Not found"
    end
  end
end
