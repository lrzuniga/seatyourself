class Reservation < ActiveRecord::Base
	belongs_to :restaurant
	belongs_to :diner

	validates :party_size,
		:numericality => { :only_integer => true, :greater_than => 1 }



	# def end_time
	# 	self.time + 2.hours
	# end
		

	after_save(:on => :create) do
		 if self.time < (Time.now + 2.hours)
			self.restaurant.seats -= self.party_size
			self.restaurant.save!
		 end		
		 
		 self.diner.loyalty_points += 1
		 self.diner.save! 
	 end



end
