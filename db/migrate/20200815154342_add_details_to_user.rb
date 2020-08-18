class AddDetailsToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :personal_summary, :text
    add_column :users, :expertise_level, :string
    add_column :users, :address, :string
    add_column :users, :available, :boolean, null: false, default: true
  end
end
