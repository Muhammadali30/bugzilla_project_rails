class RemoveProjectFromProjects < ActiveRecord::Migration[7.0]
  def change
    remove_reference :projects, :project, null: false, foreign_key: true
  end
end
