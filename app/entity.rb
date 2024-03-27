# auto_register: false
# frozen_string_literal: true

require "cerise/persistence/entity"

# @see Bookshelf::Entity
module Bookshelf
  # Base class of Bookshelf entities
  class Entity < Cerise::Persistence::Entity
  end
end
