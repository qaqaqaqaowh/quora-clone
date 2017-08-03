# Create-new
get "/questions/new" do
	erb :"questions/new"
end

#Read-show
get "/questions" do
	@questions = Question.all
	erb :"questions/show"
end

get "/questions/:id/edit" do
	@q_id = params[:id]
	erb :"questions/edit"
end

#Create-create
post "/questions" do

	@question = current_user.questions.new(params[:question])
	if @question.save
		@saved = "Posted"
		redirect "/questions"
	else
		@saved = "Not posted"
		erb :"questions/new"
	end
	
end

#Read-index
# get '/questions' do
# 	@questions = Question.all
# 	erb :"questions/index"
# end

#Read-index(own)
get '/myquestions' do
	@questions = current_user.questions
	erb :"questions/index"
end

patch "/questions/:id" do
	@question = Question.find(params[:id])
	@question.question = params[:question]
	@question.save
	@id = @question.id
	erb :"answers/show"
end

delete "/questions/:id" do
	@question = Question.find(params[:id])
	if !current_user.nil? && current_user.id == @question.user_id
		@id = @question.id
		@question.destroy
	end
	redirect "/questions"
end