#new action
get "/sign" do
	@sign_up = true
	erb :"users/new"
end

#create action
post "/signup" do
	user = User.new(params[:user])
	if user.save
		@sign_up = true
		erb :"static/index"
	else
		@sign_up = false
		erb :"users/new"
	end
end

# edit action
get "/users/:id/edit" do
	@user = User.find(params[:id])
	erb :"users/edit"
end

# update action
patch "/users/:id" do
	@user = User.find(params[:id])
	if @user == current_user
		if @user.update(params[:user])
			@updated = true
		else
			@updated = false
		end
		erb :"users/show"
	end
		
		# if !(params[:input][:email] == "" && params[:input][:name] == "" && params[:input][:password] == "")
		# 	if !(params[:input][:email] == "")
		# 		@user.update(email: (params[:input][:email]))
		# 	end
		# 	if !(params[:input][:name] == "")
		# 		@user.update(name: (params[:input][:name]))
		# 	end
		# 	if !(params[:input][:password] == "")
		# 		@user.update(password: (params[:input][:password]))
		# 	end
		# 	@updated = true
		# else
		# 	
		# end
	# end
	
end

#show action
get "/users/:id" do
	@user = User.find(params[:id])
	erb :"users/show"
end
