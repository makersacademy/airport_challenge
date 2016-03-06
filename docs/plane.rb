require_relative 'airport'


class Plane

	def initialize 
		@in_air = false
	end

	def take_off(from)
		if from.airport_open?
			fail 'This plane is not at this airport, so it cannot take off from here.' unless from.in_airport?(self)
			fail 'This plane is already in the air, so it cannot take off.' if @in_air
			from.storage.delete(self)
			@in_air =true
			plane_status
		else
			announcement
		end
	end

	def land(at)
		if at.airport_open?
			fail 'This airport is full. Do not land.' if at.full?
			fail 'This plane is already at an airport.' if @in_air ==false
			at.storage.push(self)
			@in_air = false
			plane_status
		else
			announcement
		end
	end

	def plane_status
		@in_air == true ? 'This plane has taken off and is now in the air.' : 'This plane has now landed.'
	end

	private

	def announcement
		"Due to stormy weather, this airport is closed" 
	end

end

	def list_all(class_instances)
		ObjectSpace.each_object(class_instances).to_a
	end
