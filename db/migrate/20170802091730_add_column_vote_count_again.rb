class AddColumnVoteCountAgain < ActiveRecord::Migration[5.1]
	def change
		add_column :answers, :vote_count,:integer, :default => 0
	end
end
