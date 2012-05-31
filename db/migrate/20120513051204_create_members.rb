class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :first_name
      t.string :last_name
      t.integer :number
      t.boolean :player
      t.string :position
      t.references :team

      t.timestamps
    end
    add_index :members, :team_id
  end
end
