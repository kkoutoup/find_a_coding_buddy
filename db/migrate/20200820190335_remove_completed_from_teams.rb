class RemoveCompletedFromTeams < ActiveRecord::Migration[6.0]
  def change
    remove_column :teams, :completed
  end
end
