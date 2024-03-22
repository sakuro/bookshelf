# frozen_string_literal: true

require "bcrypt"

RSpec.shared_context "Credential data encryption" do
  def credential_data(raw_password:)
    password_digest = BCrypt::Password.create(raw_password).to_s
    {algorithm: "bcrypt", password_digest:}
  end
end

RSpec.configure do |config|
  config.include_context "Credential data encryption"
end
