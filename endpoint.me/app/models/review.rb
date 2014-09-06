class Review < ActiveRecord::Base
	belongs_to :api
	belongs_to :user
	has_many :votes
	has_many :comments
end
