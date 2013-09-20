class Restaurant < ActiveRecord::Base

	has_many :reservations
	has_many :diners, :through => :reservations

	validates :name, :address, :presence => true
	validates :seats,
		:numericality => { :only_integer => true, :greater_than => 0 }
	validates :close_hour,
		:numericality => { :only_integer => true, :greater_than => :open_hour }	

end
