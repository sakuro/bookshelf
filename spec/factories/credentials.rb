# frozen_string_literal: true

require "bcrypt"

Factory.define(:credential) do |f|
  f.association(:account)
  f.type "password"
  f.data do
    raw_password = fake(:internet, :password)
    encrypted_password = BCrypt::Password.create(raw_password).to_s

    {algorithm: "bcrypt", encrypted_password:}
  end
end
