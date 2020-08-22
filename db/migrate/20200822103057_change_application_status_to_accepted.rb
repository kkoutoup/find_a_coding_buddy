class ChangeApplicationStatusToAccepted < ActiveRecord::Migration[6.0]
  def change
    rename_column :applications, :application_status, :accepted?
  end
end
