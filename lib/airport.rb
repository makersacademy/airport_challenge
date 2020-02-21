class Airport
	DEFAULT_CAPACITY = 1

	def initialize
		@capacity = DEFAULT_CAPACITY
	end

	def change_capacity(num)
		@capacity = num
	end
end

class Plane
	
	def land(airport)
		fail 'this airport is full!' if @airport
		@airport = airport
	end

	def take_off(airport)
		'The plane has taken off and is no longer in the airport'
	end
end
