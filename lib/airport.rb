require_relative 'plane'

class Airport

	attr_accessor :planes

	def initialize
		@planes = Array.new
	end

	def allow_takeoff
      raise "No planes available for takeoff" if @planes.empty?
      @planes.pop
	end

	def allow_landing(plane)
		 raise "Airport is full, cannot allow plane to land" if @planes.count >=20   
        @planes << plane
    end

    def full?
    	@planes.length >= 20
    end
end