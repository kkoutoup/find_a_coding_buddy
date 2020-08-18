class CreateProjectTechnologies < ActiveRecord::Migration[6.0]
  def change
    create_table :project_technologies do |t|
      t.references :technologies, null: false, foreign_key: true
      t.references :projects, null: false, foreign_key: true
    end
  end
end
