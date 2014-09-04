class Api < ActiveRecord::Base
	has_many :reviews
	validates :title, :description, :average_rating, presence: true
end
