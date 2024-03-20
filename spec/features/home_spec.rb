# frozen_string_literal: true

require "bcrypt"

RSpec.feature "Home" do
  context "when logged in" do
    let(:account_repo) { Hanami.app["repositories.account_repo"] }
    let(:identifier) { Faker::Internet.username(separators: %w[. _ -]) }
    let(:account) { account_repo.create(identifier:) }

    let(:credential_repo) { Hanami.app["repositories.credential_repo"] }
    let(:raw_password) { Faker::Internet.password }
    let(:encrypted_password) { BCrypt::Password.new(raw_password) }
    let(:credential) {
      credential_repo.create(
        account_id: account.id,
        type: "password",
        data: {
          algorithm: "bcrypt",
          encrypted_password: encrypted_password.to_s
        }
      )
    }

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
