# frozen_string_literal: true

RSpec.feature "Creating accounts" do
  context "when given valid attributes" do
    scenario "creates account" do
      visit "/accounts/new"

      fill_in "ID:", with: "alice"
      fill_in "Password:", with: "te$t pa$$word"
      fill_in "Password (confirm):", with: "te$t pa$$word"
      click_on "Register"

      expect(page).to have_content "Account alice has been created."
    end
  end

  context "when identifier is empty (minimum is 1)" do
    scenario "error message is displayed" do
      visit "/accounts/new"

      fill_in "ID:", with: ""
      fill_in "Password:", with: "te$t pa$$word"
      fill_in "Password (confirm):", with: "te$t pa$$word"
      click_on "Register"

      expect(page).to have_content "Could not create an account."
    end
  end

  context "when password is empty" do
    scenario "error message is displayed" do
      visit "/accounts/new"

      fill_in "ID:", with: "alice"
      fill_in "Password:", with: ""
      fill_in "Password (confirm):", with: "te$t pa$$word"
      click_on "Register"

      expect(page).to have_content "Could not create an account."
    end
  end

  context "when password mismatch with confirmation" do
    scenario "error message is displayed" do
      visit "/accounts/new"

      fill_in "ID:", with: "alice"
      fill_in "Password:", with: "te$st pa$$word"
      fill_in "Password (confirm):", with: "test password"
      click_on "Register"

      expect(page).to have_content "Could not create an account."
    end
  end
end
