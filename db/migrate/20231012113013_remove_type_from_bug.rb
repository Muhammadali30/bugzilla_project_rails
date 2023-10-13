class RemoveTypeFromBug < ActiveRecord::Migration[7.0]
  def change
    remove_column :bugs, :type, :string
  end
end
