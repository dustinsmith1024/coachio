class CreateProgresses < ActiveRecord::Migration
  def change
    create_table :progresses do |t|
      t.references :goal
      t.references :member
      t.integer :made
      t.integer :total

      t.timestamps
    end
    add_index :progresses, :goal_id
    add_index :progresses, :member_id
  end
end
