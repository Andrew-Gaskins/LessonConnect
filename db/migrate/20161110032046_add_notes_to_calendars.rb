class AddNotesToCalendars < ActiveRecord::Migration[5.0]
  def change
    add_column :calendars, :note, :text
  end
end
