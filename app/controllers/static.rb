get '/' do
  erb :"static/index"
end

get "/home" do
	erb :"static/index"
end

get "/logout" do
	redirect "/"
end