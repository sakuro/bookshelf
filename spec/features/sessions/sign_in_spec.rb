# frozen_string_literal: true

RSpec.feature "Sign in" do
  given(:raw_password) { Faker::Internet.password }
  given(:credential) { Factory[:credential, data: credential_data(raw_password:)] }
  given(:account) { credential.account }

  scenario "signs in with identifier/password valid/valid" do
    visit "/sign_in"

    fill_in "Id:", with: account.identifier
    fill_in "Password:", with: raw_password
    within("form") do
      click_on "Sign in"
    end

    expect(page).to have_current_path "/accounts/#{account.identifier}"
    expect(page).to have_content "Bookshelf::Views::Accounts::Show"
  end

  scenario "signs in with identifier/password valid/invalid" do
    visit "/sign_in"

    fill_in "Id:", with: account.identifier
    fill_in "Password:", with: ">#{+raw_password}<"
    within("form") do
      click_on "Sign in"
    end

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
    within("form") do
      click_on "Sign in"
    end

    expect(page).to have_content "Sign in failed"
    expect(page).to have_content "Bookshelf::Views::Sessions::New"
    expect(page).to have_field "Id:", with: "a#{account.identifier}z"
    # TODO: password field should be cleared
    # expect(page).to have_field "Password:", with: ""
  end
end
