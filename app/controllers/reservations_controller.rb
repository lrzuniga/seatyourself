class ReservationsController < ApplicationController
	before_filter :load_restaurant
	before_filter :ensure_logged_in, :only => [:edit, :create, :show, :update, :destroy]


	def show
		@reservation = Reservation.find(params[:id])
	end

	def create		
		@reservation = @restaurant.reservations.build(reservation_params)
		@reservation.diner_id = current_diner.id

	
		if @reservation.save
			redirect_to restaurant_path(@reservation.restaurant_id)
		else
			render :new, :alert => "THEY AREN'T OPEN THEN DUDE, TRY AGAIN"
		end		
		
	end

	def destroy
		@reservation = Reservation.find(params[:id])
		@reservation.destroy
	end

	def reservation_params
		params.require(:reservation).permit(:diner_id, :restaurant_id, :party_size, :time)
	end

	private
	def load_restaurant
		@restaurant = Restaurant.find(params[:restaurant_id])
	end

end
