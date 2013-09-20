class Reservation < ActiveRecord::Base
	belongs_to :restaurant
	belongs_to :diner

	validates :party_size,
		:numericality => { :only_integer => true, :greater_than => 0 }

	def time_verifier
		if self.time.hour	> self.restaurant.close_hour || self.time.hour < self.restaurant.open_hour
			@horseshit = 1
		end	
	end	

	def end_time
		self.time + 2.hours
	end
		

	before_save(:on => :create) do
		time_verifier
		self.restaurant.seats -= self.party_size
		self.restaurant.save!
	end



end
