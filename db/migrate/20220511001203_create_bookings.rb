class CreateBookings < ActiveRecord::Migration[6.1]
  def change
    create_table :bookings do |t|
      t.integer :date
      t.string :total_price
      t.references :user, null: false, foreign_key: true
      t.references :service_nanny, null: false, foreign_key: true

      t.timestamps
    end
  end
end
