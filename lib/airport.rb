class Plane
end

class Airport
	attr_reader :weather
  DEFAULT_CAPACITY = 100

	def initialize(capacity = DEFAULT_CAPACITY)
		@capacity = capacity
	  @hangar = []
	end

  def land(plane)
  	@hangar.push(plane)
  end

  def takeoff(plane)
  	fail "This plane is not in this airport" if !@hangar.include?(plane)
  	# using delete instead of plane to get the actual plane called for instead of the last plane landed
  	@hangar.delete(plane)
  end
  
  # ~10% chance of rain
  def stormy?
    case rand(10)
    	when 0..8 then false
    else 
      true
    end
  end

end
