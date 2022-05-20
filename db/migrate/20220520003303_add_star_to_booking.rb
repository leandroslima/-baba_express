class AddStarToBooking < ActiveRecord::Migration[6.1]
  def change
    add_column :bookings, :starts_at, :string
    add_column :bookings, :ends_at, :string
  end
end
