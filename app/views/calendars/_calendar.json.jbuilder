json.extract! calendar, :id, :student_name, :location, :day, :start_time, :end_time, :created_at, :updated_at
json.url calendar_url(calendar, format: :json)