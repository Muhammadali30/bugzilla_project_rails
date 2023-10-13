class RemoveTypeToUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :user, :type, :string
  end
end
