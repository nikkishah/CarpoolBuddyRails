json.array!(@users) do |user|
  json.extract! user, :id, :first_name, :email, :street, :city, :state, :zipcode
  json.url user_url(user, format: :json)
end
