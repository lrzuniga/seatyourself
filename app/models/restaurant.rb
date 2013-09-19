class Restaurant < ActiveRecord::Base

	has_many :reservations
	has_many :diners, :through => :reservations

	validates :name, :address, :presence => true
	validates :seats,
		:numericality => { :only_integer => true, :greater_than => 0 }
		

end
