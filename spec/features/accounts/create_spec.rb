# frozen_string_literal: true

RSpec.feature "Creating accounts" do
  it "creates an account when given valid attributes" do
    visit "/accounts/new"

    fill_in "ID:", with: "alice"
    fill_in "Password:", with: "te$t pa$$word"
    fill_in "Password (confirm):", with: "te$t pa$$word"
    click_on "Register"

    expect(page).to have_content "Account alice has been created."
  end
end
