json.array!(@calendars) do |calendar|
  json.extract! calendar, :id, :name, :user_id, :group_id
  json.url calendar_url(calendar, format: :json)
end
