class CreateUploads < ActiveRecord::Migration[5.0]
  def change
    create_table :uploads do |t|
      t.string :author
      t.text :description
      t.string :file
      t.integer :user_id

      t.timestamps
    end
  end
end
