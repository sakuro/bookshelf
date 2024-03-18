# frozen_string_literal: true

module Bookshelf
  class Settings < Hanami::Settings
    # Define your app settings here, for example:
    #
    # setting :my_flag, default: false, constructor: Types::Params::Bool
    setting :database_url, constructor: Types::String
    setting :session_secret, constructor: Types::String
    setting :locales, constructor: ->(v) { v.split(":").map(&:strip) }
  end
end
