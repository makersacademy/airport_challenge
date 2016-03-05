require_relative 'airport'

class Plane

	def take_off(from)
		fail 'This plane is not at this airport so it cannot take off.' unless from.in_airport?(self)
		from.storage.delete(self)
		'This plane has taken off and is no longer in the airport.'
	end

	def land(at)
		fail 'This airport is full. Do not land.' if at.full?
		fail 'This plane has already landed at this airport.' if at.in_airport?(self)
		at.storage.push(self)
		'This plane has now landed.'
	end
end