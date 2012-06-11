class ChangeFieldsOnResults < ActiveRecord::Migration
  def up
    remove_column :results, :activity_id
    add_column :results, :plan_id, :integer
  end

  def down
      add_column :results, :activity_id, :integer
      remove_column :results, :plan_id
  end
end
