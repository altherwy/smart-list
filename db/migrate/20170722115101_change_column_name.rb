class ChangeColumnName < ActiveRecord::Migration[5.0]
  def change
    rename_column :items, :creation_date, :due_date
  end
end
