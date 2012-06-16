class AddTableCars < ActiveRecord::Migration
  def up
    create_table :cars do |t|
      t.string :number
      t.timestamps
    end
  end

  def down
    drop_table :cars
  end
end
