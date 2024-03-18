# frozen_string_literal: true

require "hanami/setup"

require "gettext/tools/task"

Hanami.prepare

GetText::Tools::Task.define do |task|
  task.locales = Hanami.app["settings"].locales
  task.files = Dir["{app,lib}/**/*.{rb,erb}"]
  task.domain = Hanami.app.app_name.name
end
