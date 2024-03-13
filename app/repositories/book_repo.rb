# frozen_string_literal: true

module Bookshelf
  module Repositories
    class BookRepo < Bookshelf::Repository[:books]
      commands :create, update: :by_pk, delete: :by_pk

      def by_id(id)
        books.by_pk(id).one!
      end

      def index_page(page:, per_page:)
        books
          .select(:title, :author)
          .order(:title)
          .page(page)
          .per_page(per_page)
          .to_a
      end

      def max_id
        books.max(:id)
      end
    end
  end
end
