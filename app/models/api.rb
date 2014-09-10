class Api < ActiveRecord::Base
  has_many :reviews
  has_many :followings
  has_many :users, through: :followings
  include PgSearch          
  multisearchable :against => [:title, :description]
    
    def average_score
      sum = 0
      if self.reviews.length == 0
        return 0
      else
        self.reviews.each do |review|
          sum += review.score
        end
        return (sum/self.reviews.length)
      end
  end
end
