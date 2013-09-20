module ApplicationHelper

		def foo(start_time)
		timeslots = []	
		a_time = start_time
		reservation_interval = 30.minutes

		begin
			timeslots << a_time
			a_time += reservation_interval

			if (a_time + reservation_interval) > a_time.change(hour: closing_hour)
				a_time = (a_time + 1.day).change(hour: opening_hour)
			end 

		end while a_time < end_time	

		timeslots
	end	


end
