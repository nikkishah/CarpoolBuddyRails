json.array!(@posts) do |post|
  json.extract! post, :id, :forum_id, :message, :user_id
  json.url post_url(post, format: :json)
end
