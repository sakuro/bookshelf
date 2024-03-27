# auto_register: false
# frozen_string_literal: true

require "cerise/persistence/repository"

module Bookshelf
  class Repository < Cerise::Persistence::Repository
    include Deps[container: "persistence.rom"]
  end
end
