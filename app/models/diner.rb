class Diner < ActiveRecord::Base
	has_secure_password
	validates :password, :presence => true, :on => :create

	validates :email, 
		:presence => true,
		:format => {:with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i},
		:uniqueness => true


end
