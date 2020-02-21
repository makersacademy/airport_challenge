class Airport

end

class Plane
	def land(airport)
		@airport = airport
	end
	def take_off(airport)
		'The plane has taken off and is no longer in the airport'
	end
end
