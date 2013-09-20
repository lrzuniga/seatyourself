class Reservation < ActiveRecord::Base
	belongs_to :restaurant
	belongs_to :diner

	validates :party_size,
		:numericality => { :only_integer => true, :greater_than => 0 }



	# def end_time
	# 	self.time + 2.hours
	# end
		

	# before_save(:on => :create) do
	# 	if self.restaurant.party_sizes > 0
	# 		self.restaurant.seats -= self.restaurant.party_sizes
	# 	end		

	# end



end
