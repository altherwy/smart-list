class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :title
      t.date :creation_date
      t.date :expiration_date
      t.integer :work_time
      t.boolean :completed

      t.timestamps
    end
  end
end
