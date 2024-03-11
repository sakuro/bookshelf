# frozen_string_literal: true

RSpec.feature "Books index" do
  let(:books) { Hanami.app["persistence.rom"].relations[:books] }

  before do
    books.insert(title: "Practical Object-Oriented Design in Ruby", author: "Sandi Metz")
    books.insert(title: "Test Driven Development", author: "Kent Beck")
  end

  it "shows a list of books" do
    visit "/books"

    expect(page).to have_selector "li", text: "Test Driven Development, by Kent Beck"
    expect(page).to have_selector "li", text: "Practical Object-Oriented Design in Ruby, by Sandi Metz"
  end
end
