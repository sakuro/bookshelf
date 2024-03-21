# frozen_string_literal: true

RSpec.feature "Home" do
  context "when logged in" do
    given(:raw_password) { Faker::Internet.password }
    given(:credential) { Factory[:credential, data: credential_data(raw_password:)] }
    given(:account) { credential.account }

    def login_as(account)
      page.set_rack_session(account_id: account.id)
    end

    background do
      login_as(account)
    end

    scenario "redirected to the user's home" do
      visit "/"
      expect(page).to have_current_path("/accounts/#{account.identifier}")
    end
  end

  context "when not logged in" do
    scenario "visiting the home page shows a welcome message" do
      visit "/"

      expect(page).to have_current_path("/")
      expect(page).to have_content "Welcome to Bookshelf"
      expect(page).to have_text "Sign up"
      expect(page).to have_text "Sign in"
    end
  end
end
