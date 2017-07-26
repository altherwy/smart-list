class AddForeignKeyRef < ActiveRecord::Migration[5.0]
  def change
      add_foreign_key :items, :lists
  end
end
