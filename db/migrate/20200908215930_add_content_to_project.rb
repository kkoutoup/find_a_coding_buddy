class AddContentToProject < ActiveRecord::Migration[6.0]
  def change
    add_column :projects, :rich_content, :text
  end
end
