# auto_register: false
# frozen_string_literal: true

require "rom-repository"

module Bookshelf
  module Repository
    def self.[](root)
      ROM::Repository[root].extend(ClassMethods)
    end

    module ClassMethods
      def self.extended(klass)
        klass.include Deps[container: "persistence.rom"]
      end
    end
  end
end
