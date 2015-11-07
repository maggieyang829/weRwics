json.array!(@users) do |user|
  json.extract! user, :id, :name, :state, :city, :profession, :description
  json.url user_url(user, format: :json)
end
