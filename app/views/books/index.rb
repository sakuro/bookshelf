# frozen_string_literal: true

module Bookshelf
  module Views
    module Books
      class Index < Bookshelf::View
        include Deps["persistence.rom"]

        expose :books do
          rom.relations[:books]
            .select(:title, :author)
            .order(:title)
            .to_a
        end
      end
    end
  end
end
