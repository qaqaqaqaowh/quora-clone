class CreateVotes < ActiveRecord::Migration[5.1]
	def change
		create_table :votes do |t|
			t.integer :user_id
			t.integer :answer_id
			t.boolean :state
		end
	end
end