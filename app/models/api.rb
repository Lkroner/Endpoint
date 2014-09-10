class Api < ActiveRecord::Base
  has_many :reviews
  has_many :followings
  has_many :users, through: :followings
  include PgSearch          
  multisearchable :against => [:title, :description]
    
  def average_score
    average = 0
    if self.reviews.count == 0
      return average
    else
      sum = 0
      self.reviews.each do |review|
        sum += review.score
      end
      average = (sum.to_f/self.reviews.count)
    end
    return average
  end
  
end
