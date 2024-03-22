# frozen_string_literal: true

require "bcrypt"

Factory.define(:credential) do |f|
  f.association(:account)
  f.type "password"
  f.data do
    raw_password = fake(:internet, :password)
    password_digest = BCrypt::Password.create(raw_password).to_s

    {algorithm: "bcrypt", password_digest:}
  end
end
