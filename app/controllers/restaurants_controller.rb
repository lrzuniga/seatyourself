class RestaurantsController < ApplicationController

	def index
		@restaurants = Restaurant.all
	end

	def show
		@restaurant = Restaurant.find(params[:id])

		if current_diner
      @reservation = @restaurant.reservations.build
    end
	end

	def new
		@restaurant = Restaurant.new
		@times = []
		zippo = 11
			until zippo == 20
				@times << zippo
				zippo += 1
			end
		@times		
	end

	def create
		@restaurant = Restaurant.new(restaurant_params)

		if @restaurant.save
			redirect_to restaurants_path
		else
			render :new
		end		
	end

	def edit
		@restaurant = Restaurant.find(params[:id])
	end

	def update
		@restaurant = Restaurant.find(params[:id])
		@restaurant.update_attributes(restaurant_params)

		if @restaurant.save
			redirect_to restaurants_path
		else
			render :edit
		end		
	end

	def destroy
		@restaurant = Restaurant.find(params[:id])
		@restaurant.destroy
		redirect_to restaurants_path
	end

	def restaurant_params
		params.require(:restaurant).permit(:name, :address, :description, :seats, :open_hour, :close_hour)
	end
end