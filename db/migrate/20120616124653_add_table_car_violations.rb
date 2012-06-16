class AddTableCarViolations < ActiveRecord::Migration
  def up
    create_table :car_violations do |t|
      t.references :car
      t.string :description
      t.float :lat
      t.float :lang
      t.references :city
      t.string :address
      t.string :state
      t.integer :count_good
      t.integer :count_bad
      t.float :rating
      t.timestamps
    end
  end

  def down
    drop_table :car_violations
  end
end
