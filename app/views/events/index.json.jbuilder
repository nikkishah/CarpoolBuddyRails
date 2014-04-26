json.array!(@events) do |event|
  json.extract! event, :id, :datetime, :user_id, :calendar_id
  json.url event_url(event, format: :json)
end
