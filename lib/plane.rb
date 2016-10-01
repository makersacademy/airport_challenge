require_relative 'airport'
class Plane

	def land(airport)
		airport.landed_planes << self
	end

	def landed?
		true
	end

end