# frozen_string_literal: true

ROM::SQL.migration do
  change do
    create_table :credentials do
      primary_key :id
      foreign_key :account_id, :accounts, null: false
      column :type, :text, null: false
      column :data, :jsonb, null: false
      unique %i[account_id type]
    end
  end
end
