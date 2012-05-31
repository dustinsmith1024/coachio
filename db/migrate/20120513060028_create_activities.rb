class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :name
      t.integer :minutes
      t.boolean :group
      t.references :team

      t.timestamps
    end
    add_index :activities, :team_id
  end
end
