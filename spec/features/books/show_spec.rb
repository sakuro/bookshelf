# frozen_string_literal: true

RSpec.feature "Showing a book" do
  let(:book_repo) { Hanami.app["repositories.book_repo"] }

  let!(:book_id) do
    book_repo.create(title: "Test Driven Development", author: "Kent Beck").id
  end

  context "when a book matches the given ID" do
    it "shows the book" do
      visit "/books/#{book_id}"

      expect(page).to have_content "Test Driven Development"
      expect(page).to have_content "Kent Beck"
    end
  end

  context "when no book matches the given ID" do
    it "returns not found" do
      visit "/books/#{book_repo.max_id + 1}"

      expect(page.status_code).to eq 404
    end
  end
end
