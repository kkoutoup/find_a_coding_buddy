class ChangeColumnNameFromCompletedToStatus < ActiveRecord::Migration[6.0]
  def change
    rename_column :projects, :completed?, :status
  end
end
