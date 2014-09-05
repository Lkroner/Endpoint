class Review < ActiveRecord::Base
	validates :score, :content, :title, presence: true
	belongs_to :api
	belongs_to :user
	has_many :votes
	has_many :comments
end
