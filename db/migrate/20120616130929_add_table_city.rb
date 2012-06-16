class AddTableCity < ActiveRecord::Migration
  def up
    create_table :cities do |t|
      t.string :name
    end
  end

  def down
    drop_table :cities
  end
end
