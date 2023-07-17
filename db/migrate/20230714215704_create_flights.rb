class CreateFlights < ActiveRecord::Migration[7.0]
  def change
    create_table :flights do |t|
      t.string :number
      t.integer :departure_id
      t.integer :arrival_id
      t.datetime :start_datetime
      t.integer :duration

      t.timestamps
    end
  end
end
