# frozen_string_literal: true

module Bookshelf
  module Views
    module Parts
      class Errors < Bookshelf::Views::Part
        def [](*path)
          value.find {|e| e.path == path }
        end
      end
    end
  end
end
