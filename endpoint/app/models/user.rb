class User < ActiveRecord::Base
	validates :email, :password, presence: true
	has_many :reviews
	has_many :votes
	has_many :comments
	has_many :followings
	has_many :apis, through: :followings
end
