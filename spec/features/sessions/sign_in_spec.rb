# frozen_string_literal: true

require "bcrypt"

RSpec.feature "Sign in" do
  let(:account_repo) { Hanami.app["repositories.account_repo"] }
  let(:identifier) { Faker::Internet.username(separators: %w[. _ -]) }
  let(:raw_password) { Faker::Internet.password }
  let(:encrypted_password) { BCrypt::Password.create(raw_password).to_s }
  let(:account) { account_repo.create_with_encrypted_password(identifier, encrypted_password) }

  scenario "signs in with identifier/password valid/valid" do
    visit "/sign_in"

    fill_in "Id:", with: account.identifier
    fill_in "Password:", with: raw_password
    click_on "Sign in"

    expect(page).to have_current_path "/accounts/#{account.identifier}"
    expect(page).to have_content "Bookshelf::Views::Accounts::Show"
  end

  scenario "signs in with identifier/password valid/invalid" do
    visit "/sign_in"

    fill_in "Id:", with: account.identifier
    fill_in "Password:", with: ">#{+raw_password}<"
    click_on "Sign in"

    expect(page).to have_content "Sign in failed"
    expect(page).to have_content "Bookshelf::Views::Sessions::New"
    expect(page).to have_field "Id:", with: account.identifier
    # TODO: password field should be cleared
    # expect(page).to have_field "Password:", with: ""
  end

  scenario "signs in with identifier/password invalid/valid" do
    visit "/sign_in"

    fill_in "Id:", with: "a#{account.identifier}z"
    fill_in "Password:", with: raw_password
    click_on "Sign in"

    expect(page).to have_content "Sign in failed"
    expect(page).to have_content "Bookshelf::Views::Sessions::New"
    expect(page).to have_field "Id:", with: "a#{account.identifier}z"
    # TODO: password field should be cleared
    # expect(page).to have_field "Password:", with: ""
  end
end
