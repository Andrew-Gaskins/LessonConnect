class CreateTeacherMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :teacher_messages do |t|
      t.string :title
      t.string :author
      t.text :teacher_message_entry
      t.integer :user_id

      t.timestamps
    end
  end
end
