get "/log" do
	@login = true
	erb :"sessions/new"
end



# Create for session
post "/login" do
	@user = User.find_by(email: params[:user][:email])
	if @user && @user.authenticate(params[:user][:password])
		session[:user_id] = @user.id
		redirect "/users/#{@user.id}"
	else
		@login = false
		erb :"sessions/new"
	end
end

# delete for session
post "/logout" do
	@signout = true
	session.destroy
	erb :"static/index"
end

