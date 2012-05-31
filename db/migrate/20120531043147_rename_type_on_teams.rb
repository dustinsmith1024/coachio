class RenameTypeOnTeams < ActiveRecord::Migration
  def change
    rename_column :teams, :type, :kind
  end
end
