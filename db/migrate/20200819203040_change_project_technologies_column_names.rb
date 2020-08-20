class ChangeProjectTechnologiesColumnNames < ActiveRecord::Migration[6.0]
  def change
    rename_column :project_technologies, :technologies_id, :technology_id
    rename_column :project_technologies, :projects_id, :project_id
  end
end
