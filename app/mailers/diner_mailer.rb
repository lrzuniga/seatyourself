class DinerMailer < ActionMailer::Base
  default from: "davidfreiman@gmail.com"

  def reservation_confirmation(diner, reservation)
  	@diner = diner
  	@reservation = reservation
  	mail(to: @diner.email, subject: 'Thanks for making a reservation with Seat Yourself!')
  	
  end
end
