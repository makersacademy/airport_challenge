require_relative 'plane'

class Airport
	DEFAULT_CAPACITY = 20

	attr_reader :capacity

	def  initialize
		@planes = []
		@capacity = DEFAULT_CAPACITY
	end

	def land_plane(plane)
    	fail 'Airport is full' if full?
    	plane.land
    	planes << plane
    end

    

	def take_off
		fail 'Airport is empty' if empty?
    	plane = planes.pop
    	plane.take_off
    	plane
    end

    
    private

  attr_reader :planes

  def full?
    planes.count >= capacity
  end


  def empty?
    planes.empty?
  end
end

