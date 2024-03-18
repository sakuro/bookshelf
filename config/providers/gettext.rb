# frozen_string_literal: true

Hanami.app.register_provider :gettext, namespace: true do
  prepare do
    require "gettext"
    require "locale"
  end

  start do
    Object.include(GetText)
    Object.bindtextdomain(Hanami.app.app_name.name)
  end
end
