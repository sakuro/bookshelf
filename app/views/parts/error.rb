# frozen_string_literal: true

module Bookshelf
  module Views
    module Parts
      class Error < Bookshelf::Views::Part
        def to_s
          "%<path>s %<text>s" % {path: path.join(" "), text:}
        end
      end
    end
  end
end
