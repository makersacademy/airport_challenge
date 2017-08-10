#Airport Challenge: Weather 

class Weather

	#Random number generator with '1' representing a bad weather situation:

	def forecast? 
		x = rand(1...5)
		x == 1 
	end
end