class AddFieldsToPlans < ActiveRecord::Migration
  def change
    add_column :plans, :reps, :integer
    add_column :plans, :minutes, :integer
  end
end
