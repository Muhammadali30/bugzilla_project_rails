class RemoveTypeToBug < ActiveRecord::Migration[7.0]
  def change
    remove_column :bug, :type, :string
  end
end
