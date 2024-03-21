# auto_register: false
# frozen_string_literal: true

module Bookshelf
  module Views
    class Context < Hanami::View::Context
      def current_path
        request.fullpath
      end

      def current_path?(path)
        current_path == path
      end
    end
  end
end
