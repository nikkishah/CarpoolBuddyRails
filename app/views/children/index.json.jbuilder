json.array!(@children) do |child|
  json.extract! child, :id, :name, :highschool, :sex, :grade, :passcode
  json.url child_url(child, format: :json)
end
