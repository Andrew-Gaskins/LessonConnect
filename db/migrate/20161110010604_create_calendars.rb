class CreateCalendars < ActiveRecord::Migration[5.0]
  def change
    create_table :calendars do |t|
      t.string :student_name
      t.string :location
      t.string :day
      t.time :start_time
      t.time :end_time

      t.timestamps
    end
  end
end
