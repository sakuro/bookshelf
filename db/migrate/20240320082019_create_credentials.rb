# frozen_string_literal: true

ROM::SQL.migration do
  change do
    create_table :credentials do
      primary_key :id
      foreign_key :account_id, :accounts
      column :type, :text, null: false
      column :data, :json, null: false
      unique %i[account_id type]
    end
  end
end
