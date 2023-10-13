class RemoveTitleFromBug < ActiveRecord::Migration[7.0]
  def change
    remove_column :bugs, :title, :string
  end
end
