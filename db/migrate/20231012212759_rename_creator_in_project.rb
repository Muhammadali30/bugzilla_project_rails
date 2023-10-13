class RenameCreatorInProject < ActiveRecord::Migration[7.0]
  def change
    rename_column :projects, :creator_id, :userid
  end
end
