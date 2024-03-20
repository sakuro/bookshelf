# frozen_string_literal: true

module Bookshelf
  module Operations
    module Sessions
      class Create < Bookshelf::Operation
        step :validate, with: "operations.steps.sessions.validate"
        step :authenticate, with: "operations.steps.sessions.authenticate"
      end
    end
  end
end
