class AddTableCarViolations < ActiveRecord::Migration
  def up
    create_table :car_violations do |t|
      t.references :car
      t.string :description
      t.float :lat
      t.float :long
      t.references :area
      t.references :city
      t.string :address
      t.string :state
      t.integer :count_good, :default => 0
      t.integer :count_bad, :default => 0
      t.float :rating
      t.attachment :image
      t.timestamps
    end
  end

  def down
    drop_table :car_violations
  end
end
