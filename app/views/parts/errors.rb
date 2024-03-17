# frozen_string_literal: true

module Bookshelf
  module Views
    module Parts
      class Errors < Bookshelf::Views::Part
        def has?(*path)
          !!value.find {|e| e.path == path }
        end

        # Renders list of errors messages for given key
        def list(*path)
          render "errors", errors_for_key: value.select {|e| e.path == path }
        end
      end
    end
  end
end
