# frozen_string_literal: true

module Bookshelf
  module Views
    module Books
      class Show < Bookshelf::View
        include Deps["persistence.rom"]

        expose :book do |id:|
          rom.relations[:books].by_pk(id).one!
        end
      end
    end
  end
end
