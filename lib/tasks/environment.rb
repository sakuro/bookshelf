# frozen_string_literal: true

task :environment do
  require_relative "../../config/app"
  require "hanami/prepare"
end
