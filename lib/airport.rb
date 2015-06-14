require_relative 'plane'

class Airport
	DEFAULT_CAPACITY = 20

	attr_reader :capacity

	def  initialize
		@planes = []
		@capacity = DEFAULT_CAPACITY
	end

	def release_plane 
		fail 'Airport is empty' if @capacity = 0
    	planes.pop
    end

    def land_plane 
    	fail 'Airport is full' if @capacity = 20
    	planes.pop
    end

    def take_off
    	fail 'Airport is empty' if capacity
    	planes.pop
    end
end
