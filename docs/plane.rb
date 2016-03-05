require_relative 'airport'

class Plane

	def take_off(from)
		from.storage.delete(self)
		'This plane has taken off and is no longer in the airport'
	end

	def land(at)
		at.storage.push(self)
		'This plane has now landed'
	end
end