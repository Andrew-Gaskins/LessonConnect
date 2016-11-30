class CreateUploadComments < ActiveRecord::Migration[5.0]
  def change
    create_table :upload_comments do |t|
      t.string :author
      t.text :comment_entry
      t.integer :user_id
      t.integer :upload_id

      t.timestamps
    end
  end
end
