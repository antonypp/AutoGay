class AddTableViolationComments < ActiveRecord::Migration
  def up
    create_table :car_violation_comments do |t|
      t.string :text
      t.references :violation
    end
  end

  def down
    drop_table :car_violation_comments
  end
end
