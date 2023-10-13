class AddUniqueTitleToBug < ActiveRecord::Migration[7.0]
  def change
    add_column :bugs, :title, :string
    add_index :bugs, :title, unique: true
  end
end
