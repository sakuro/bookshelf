# frozen_string_literal: true

require "dry/transformer"
require "dry/types"

module Bookshelf
  Types = Dry.Types

  module Types
    # Define your custom types here
    module Transforms
      extend Dry::Transformer::Registry

      import Dry::Transformer::HashTransformations
      import Dry::Transformer::Recursion
    end

    private_class_method def self.t(*) = Transforms[*]

    RecursivelySymbolizeKeys = t(:hash_recursion, t(:symbolize_keys))
    public_constant :RecursivelySymbolizeKeys
  end
end
