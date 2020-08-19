class ChangeUserTechnologiesColumnNames < ActiveRecord::Migration[6.0]
  def change
    rename_column :user_technologies, :technologies_id, :technology_id
    rename_column :user_technologies, :users_id, :user_id
  end
end
