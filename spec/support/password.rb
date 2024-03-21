# frozen_string_literal: true

require "bcrypt"

RSpec.shared_context "Credential data encryption" do
  def credential_data(raw_password:)
    encrypted_password = BCrypt::Password.create(raw_password).to_s
    {algorithm: "bcrypt", encrypted_password:}
  end
end

RSpec.configure do |config|
  config.include_context "Credential data encryption"
end
