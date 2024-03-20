# auto_register: false
# frozen_string_literal: true

require "gettext"

module Bookshelf
  module Views
    class Scope < Hanami::View::Scope
      include GetText

      bindtextdomain(Hanami.app.app_name.name)
    end
  end
end
