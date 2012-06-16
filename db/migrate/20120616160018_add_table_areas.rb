class AddTableAreas < ActiveRecord::Migration
  def up
    create_table :areas do |t|
      t.string :name
    end
  end

  def down
    drop_table :areas
  end
end
