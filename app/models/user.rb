class User < ActiveRecord::Base
	has_secure_password
	validates :email, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i}
	has_many :questions, dependent: :destroy
	has_many :answers
	has_many :votes, dependent: :destroy
end
