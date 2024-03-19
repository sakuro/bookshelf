# auto_register: false
# frozen_string_literal: true

module Bookshelf
  module Views
    module Helpers
      def current_path?(path)
        _context.current_path?(path)
      end
    end
  end
end
