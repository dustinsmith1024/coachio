class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.integer :reps
      t.references :practice
      t.references :activity

      t.timestamps
    end
    add_index :results, :practice_id
    add_index :results, :activity_id
  end
end
