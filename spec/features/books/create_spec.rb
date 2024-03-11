# spec/features/books/create_spec.rb

RSpec.feature "Creating books" do
  it "creates a book when given valid attributes" do
    visit "/books/new"

    fill_in "Title", with: "Practical Object-Oriented Design in Ruby"
    fill_in "Author", with: "Sandi Metz"
    click_on "Create"

    expect(page).to have_content "Book created"
    expect(page).to have_selector "h1", text: "Practical Object-Oriented Design in Ruby"
    expect(page).to have_selector "p", text: "Sandi Metz"
  end

  it "shows errors and does not create the book when given invalid attributes" do
    visit "/books/new"

    fill_in "Title", with: "Practical Object-Oriented Design in Ruby"
    click_on "Create"

    expect(page).to have_content "Could not create book"
    expect(page).to have_field "Title", with: "Practical Object-Oriented Design in Ruby"
    expect(page).to have_field "Author", with: ""
  end
end
