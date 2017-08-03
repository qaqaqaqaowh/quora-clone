class RemoveColumnVoteCount < ActiveRecord::Migration[5.1]
	def change
		remove_column :answers, :vote_count
	end
end
