class CreateFlights < ActiveRecord::Migration[5.0]
  def change
    create_table :flights do |t|
      t.string :from
      t.string :to
      t.string :airline
      t.integer :num_passenger

      t.timestamps
    end
  end
end
