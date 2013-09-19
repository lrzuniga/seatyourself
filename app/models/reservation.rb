class Reservation < ActiveRecord::Base
	belongs_to :restaurant
	belongs_to :diner

	validates :party_size,
		:numericality => { :only_integer => true, :greater_than => 0 }
		

	before_save(:on => :create) do
		self.restaurant.seats -= self.party_size
		self.restaurant.save!
	end

end
