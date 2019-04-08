require_relative "plane"

class Airport

	attr_accessor :capacity, :planes

	def land_a_plane

		if @planes != nil
			if @planes < @capacity
				@planes += 1
			else
				puts "Plane can't land. Airport full."
			end
		else
			@planes = 1
		end
	end

	def take_off
		Plane.new
	end

end