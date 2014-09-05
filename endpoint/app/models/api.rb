class Api < ActiveRecord::Base
	has_many :reviews
	validates :title, :description, :average_rating, presence: true
	has_many :followings
	has_many :users, through: :followings
end
