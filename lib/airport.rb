class Airport

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
