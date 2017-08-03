get "/answers/show" do
	erb :"answers/show"
end

get "/answers/:id/edit" do
	@a_id = params[:id]
	erb :"answers/edit"
end

post "/questions/:id/answers" do
	@question = Question.find(params[:id])
	@answer = current_user.answers.new(answer: params[:answer], question_id: @question.id)
	if @answer.save
		@saved = "Posted"
	else
		@saved = "Not posted"
	end
	erb :"answers/show"
end

post "/answers/:answer_id/vote" do
	@answer = Answer.find(params[:answer_id])
	#find out if that fella voted this answer before
	@upvoted = Vote.find_by(user_id: current_user.id, answer_id: params[:answer_id], state: true)
	@downvoted = Vote.find_by(user_id: current_user.id, answer_id: params[:answer_id], state: false)
	if !@upvoted.nil?
		@vote = @upvoted
	elsif !@downvoted.nil?
		@vote = @downvoted
	end
	@upvoted = !@upvoted.nil?
	@downvoted = !@downvoted.nil?
	input = params[:vote]
	command = input.split(" ")
	if @upvoted && command[0] == "Downvote:"
		@vote.update(state: false)
	elsif @upvoted && command[0] == "Upvote:"
		@vote.destroy
	elsif @downvoted && command[0] == "Downvote:"
		@vote.destroy
	elsif @downvoted && command[0] == "Upvote:"
		@vote.update(state: true)
	elsif @upvoted == false && @upvoted == @downvoted
		if command[0] == "Upvote:"
			@vote = current_user.votes.new(answer_id: params[:answer_id], state: true)
		elsif command[0] == "Downvote:"
			@vote = current_user.votes.new(answer_id: params[:answer_id], state: false)
		end
		@vote.save
	end
	@upvote_count = @answer.votes.where(state: true).count
	@downvote_count = @answer.votes.where(state: false).count
	@vote_count = @upvote_count - @downvote_count
	@answer.update(vote_count: @vote_count)
	@id = @answer.question_id
	@this = {upvote: @upvote_count}
	@this.to_json
	erb :"answers/show"
end

patch "/answers/:id" do
	@answer = Answer.find(params[:id])
	@answer.answer = params[:answer]
	@answer.save
	@id = @answer.question_id
	erb :"answers/show"
end

delete "/answers/:id" do
	@answer = Answer.find(params[:id])
	if !current_user.nil? && current_user.id == @answer.user_id
		@id = @answer.question_id
		@answer.destroy
	end
	erb :"answers/show"
end