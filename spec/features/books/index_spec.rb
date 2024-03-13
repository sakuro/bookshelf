# frozen_string_literal: true

RSpec.feature "Books index" do
  let(:book_repo) { Hanami.app["repositories.book_repo"] }

  before do
    book_repo.create(title: "Practical Object-Oriented Design in Ruby", author: "Sandi Metz")
    book_repo.create(title: "Test Driven Development", author: "Kent Beck")
  end

  it "shows a list of books" do
    visit "/books"

    expect(page).to have_css "li", text: "Test Driven Development, by Kent Beck"
    expect(page).to have_css "li", text: "Practical Object-Oriented Design in Ruby, by Sandi Metz"
  end
end
