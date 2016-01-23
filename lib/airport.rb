require_relative 'plane'

class Airport

	attr_reader :plane

	def allow_takeoff
      Plane.new
	end

	def allow_landing(plane)
		@plane = plane
    end

    def stormy_weather?

    end
end