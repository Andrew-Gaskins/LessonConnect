class AddFilerToUploads < ActiveRecord::Migration[5.0]
  def change
    add_column :uploads, :filer, :string
  end
end
