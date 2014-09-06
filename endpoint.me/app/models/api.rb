class Api < ActiveRecord::Base
	has_many :reviews
	has_many :followings
	has_many :users, through: :followings
	attr_accessor :average_score
end
