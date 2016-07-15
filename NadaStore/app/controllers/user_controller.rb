class UserController < ApplicationController 
  def create 
  	@payload = '{"user":'+'{"username":"' + params[:user][:username].to_s + '", "password":"' + params[:user][:password].to_s + '"' +
  	+ ', "firstname":"' + params[:user][:firstname].to_s + '"' ++ ', "email":"' + params[:user][:email].to_s + '"' + '}}'
	@res_json = RestClient.post 'http://localhost:3030/users', @payload, :content_type => 'application/json'
	@res = JSON.parse(@res_json)
	@done = "user has been created successfully!!"
	# redirect_to welcome_signup_path
  end

  def login 
  	@payload = '{"user":'+'{"username":"' + params[:user][:username].to_s + '", "password":"' + params[:user][:password].to_s + '"}}'
  	@res = RestClient.post 'http://localhost:3030/users/login', @payload, :content_type => 'application/json'		
  end
end
# 1.6.1  # RestClient.post 'http://example.com/resource', 'the post body', :content_type => 'text/plain'
