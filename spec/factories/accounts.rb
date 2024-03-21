# frozen_string_literal: true

Factory.define(:account) do |f|
  f.identifier { fake(:internet, :username, separators: %w[_ -]) }
  f.association(:credentials, count: 1)
end
