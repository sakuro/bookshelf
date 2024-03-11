# frozen_string_literal: true

RSpec.feature "Books index pagination" do
  let(:books) { Hanami.app["persistence.rom"].relations[:books] }

  before do
    10.times do |n|
      books.insert(title: "Book #{n}", author: "Author #{n}")
    end
  end

  it "returns the correct page of books" do
    visit "/books?page=1&per_page=3"

    expect(page).to have_selector "li", count: 3
    expect(page.find("li:nth-child(1)")).to have_content "Book 0, by Author 0"
    expect(page.find("li:nth-child(2)")).to have_content "Book 1, by Author 1"
    expect(page.find("li:nth-child(3)")).to have_content "Book 2, by Author 2"
  end
end
