class CreateUserTechnologies < ActiveRecord::Migration[6.0]
  def change
    create_table :user_technologies do |t|
      t.references :technologies, null: false, foreign_key: true
      t.references :users, null: false, foreign_key: true
    end
  end
end
