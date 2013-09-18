class SessionsController < ApplicationController

	def new
		
	end

	def create
		diner = Diner.find_by_email(params[:email])
		if diner && diner.authenticate(params[:password])
			session[:diner_id] = diner.id
			redirect_to restaurants_path, :notice => "Logged In!"
		else
			render :new
		end		
	end

	def destroy
		session[:diner_id] = nil
		redirect_to restaurants_path, :notice => "Logged Out!"
	end

end