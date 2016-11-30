class AddValueToUploads < ActiveRecord::Migration[5.0]
  def change
    add_column :uploads, :teacher_id, :integer
  end
end
