class Review < ActiveRecord::Base
	validates :rating, :content, :title, presence: true
	belongs_to :api
	belongs_to :user
	has_many :votes
	validates :content, length { maximum: 1000}
end
