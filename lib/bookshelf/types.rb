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

    T = Transforms
    private_constant :T

    RecursivelySymbolizeKeys = T[:hash_recursion, T[:symbolize_keys]]
    public_constant :RecursivelySymbolizeKeys
  end
end
