json.array!(@users) do |user|
  json.extract! user, :id, :name, :email, :state, :profession, :description
  json.url user_url(user, format: :json)
end
