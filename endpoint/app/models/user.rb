class User < ActiveRecord::Base
	validates :email, :password, presence: true
	has_many :reviews
	has_many :votes
end
