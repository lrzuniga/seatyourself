class DinersController < ApplicationController

	def show
		@diner = diner.find(params[:id])
	end

	def new
		@diner = diner.new
	end

	def create
		@diner = diner.new(diner_params)

		if @diner.save
			redirect_to diner_path(@diner.id)
		else
			render :new
		end		
	end

	def diner_params
		params.require(:diner).permit(:name, :email, :password_digest)
	end

end