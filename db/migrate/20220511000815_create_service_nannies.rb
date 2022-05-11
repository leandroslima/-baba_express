class CreateServiceNannies < ActiveRecord::Migration[6.1]
  def change
    create_table :service_nannies do |t|
      t.integer :price
      t.integer :days
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
