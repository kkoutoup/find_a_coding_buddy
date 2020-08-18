class AddApplicationStatusToBooking < ActiveRecord::Migration[6.0]
  def change
    add_column :bookings, :application_status, :boolean
  end
end
