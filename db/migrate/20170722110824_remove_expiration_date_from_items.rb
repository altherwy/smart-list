class RemoveExpirationDateFromItems < ActiveRecord::Migration[5.0]
  def change
    remove_column :items, :expiration_date, :date
  end
end
