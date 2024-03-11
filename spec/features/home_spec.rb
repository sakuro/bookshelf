# frozen_string_literal: true

RSpec.feature "Home" do
  scenario "visiting the home page shows a welcome message" do
    visit "/"

    expect(page).to have_content "Welcome to Bookshelf"
  end
end
