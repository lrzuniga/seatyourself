class Restaurant < ActiveRecord::Base

	validates :name, :address, :presence => true
	validates :seats, :numericality => { :only_integer => true }

end
