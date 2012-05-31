class CreatePlans < ActiveRecord::Migration
  def change
    create_table :plans do |t|
      t.integer :activity_id
      t.integer :workout_id
      t.boolean :individual
      t.boolean :public

      t.timestamps
    end
  end
end
