# frozen_string_literal: true

require "hanami/boot"
require "rom/factory"

Factory = ROM::Factory.configure do |config|
  config.rom = Hanami.app["persistence.rom"]
end

SPEC_ROOT.glob("factories/*.rb").each {|f| require f }
