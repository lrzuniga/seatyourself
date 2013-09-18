class Reservation < ActiveRecord::Base
	belongs_to :restaurant
	belongs_to :diner

end
