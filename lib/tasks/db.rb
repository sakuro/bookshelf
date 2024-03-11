# frozen_string_literal: true

require "rom/sql/rake_task"

namespace :db do
  # desc "Prepare for database connectrion"
  task setup: :environment do
    Hanami.app.prepare(:persistence)
    ROM::SQL::RakeSupport.env = Hanami.app["persistence.config"]
  end
end
