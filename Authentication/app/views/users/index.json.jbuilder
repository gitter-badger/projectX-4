json.array!(@users) do |user|
  json.extract! user, :id, :firstname, :lastname, :password, :email, :username
  json.url user_url(user, format: :json)
end
