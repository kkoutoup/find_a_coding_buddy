class ChangeApplicationStatusFromAcceptedToStatus < ActiveRecord::Migration[6.0]
  def change
    rename_column :applications, :accepted?, :status
  end
end
