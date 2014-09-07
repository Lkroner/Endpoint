class User < ActiveRecord::Base
	include BCrypt
	def password
    	@password ||= Password.new(password_hash)
  	end
  	def password=(new_password)
	    @password = Password.create(new_password)
	    self.password_hash = @password
  	end
  	
	has_many :reviews
	has_many :votes
	has_many :comments
	has_many :followings
	has_many :apis, through: :followings
end
