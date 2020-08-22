class ChangeColumnCompletedToQuestionMark < ActiveRecord::Migration[6.0]
  def change
    rename_column :projects, :completed, :completed?
  end
end
