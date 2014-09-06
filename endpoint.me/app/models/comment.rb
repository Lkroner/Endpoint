class Comment < ActiveRecord::Base
	belongs_to :user
	belongs_to :review
	# validates :content, presence: true
end
