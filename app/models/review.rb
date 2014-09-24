class Review < ActiveRecord::Base
	belongs_to :api
	belongs_to :user
	has_many :votes
	has_many :comments
  validates :score, :presence => {:message => "Score cannot be blank"}
  validates :content, :presence => {:message => "Content cannot be blank"}
  validates :title, :presence => {:message => "Title cannot be blank"}
end
