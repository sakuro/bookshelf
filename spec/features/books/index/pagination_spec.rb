# frozen_string_literal: true

RSpec.feature "Books index pagination" do
  let(:book_repo) { Hanami.app["repositories.book_repo"] }

  before do
    10.times do |n|
      book_repo.create(title: "Book #{n}", author: "Author #{n}")
    end
  end

  it "returns the correct page of books" do
    visit "/books?page=1&per_page=3"

    expect(page).to have_css "tbody tr", count: 3
    expect(page.find("tbody tr:nth-child(1) td:nth-child(1)")).to have_content "Book 0"
    expect(page.find("tbody tr:nth-child(1) td:nth-child(2)")).to have_content "Author 0"
    expect(page.find("tbody tr:nth-child(2) td:nth-child(1)")).to have_content "Book 1"
    expect(page.find("tbody tr:nth-child(2) td:nth-child(2)")).to have_content "Author 1"
    expect(page.find("tbody tr:nth-child(3) td:nth-child(1)")).to have_content "Book 2"
    expect(page.find("tbody tr:nth-child(3) td:nth-child(2)")).to have_content "Author 2"
  end
end
