class Reservation < ActiveRecord::Base
	belongs_to :restaurant
	belongs_to :diner

	validates :party_size,
		:numericality => { :only_integer => true, :greater_than => 0 }

	def time_play
		if self.time.hour	> self.restaurant.close_hour || self.time.hour < self.restaurant.open_hour
			raise "It's not open!!!"
			redirect_to restaurants_path
		end	
	end	

		

	before_save(:on => :create) do
		time_play
		self.restaurant.seats -= self.party_size
		self.restaurant.save!
	end



end
