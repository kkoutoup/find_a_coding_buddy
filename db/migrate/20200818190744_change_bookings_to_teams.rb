class ChangeBookingsToTeams < ActiveRecord::Migration[6.0]
  def change
    rename_table :bookings, :teams
  end
end
