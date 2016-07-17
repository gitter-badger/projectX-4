class UserController < ApplicationController 
  def create 
  payload = {:username => params[:user][:username].to_s, :password => params[:user][:password].to_s,
              :firstname => params[:user][:firstname].to_s, :email => params[:user][:email].to_s,
              :lastname => params[:user][:lastname].to_s,
            }
  payload_json = payload.to_json   
	@res_json = RestClient.post 'http://localhost:3030/users', payload_json, :content_type => 'application/json'
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
