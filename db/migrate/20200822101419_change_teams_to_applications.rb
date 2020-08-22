class ChangeTeamsToApplications < ActiveRecord::Migration[6.0]
  def change
    rename_table :teams, :applications
  end
end
