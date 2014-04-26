json.array!(@forums) do |forum|
  json.extract! forum, :id, :group_id
  json.url forum_url(forum, format: :json)
end
