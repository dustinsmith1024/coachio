class AddFieldsToPractice < ActiveRecord::Migration
  def change
    add_column :practices, :complete, :boolean
    add_column :practices, :notes, :text
  end
end
