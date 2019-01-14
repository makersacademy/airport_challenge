class Plane
end

class Airport
	attr_reader :hangar, :capacity
  DEFAULT_CAPACITY = 20

	def initialize(capacity = DEFAULT_CAPACITY)
		@capacity = capacity
	  @hangar = []
	end

  def land(plane)
  	fail "This airport is at capacity." if @hangar.length == @capacity
  	fail "Wait for better weather." if self.stormy?
  	@hangar.push(plane)
  end

  def takeoff(plane)
  	fail "This plane is not in this airport." if !@hangar.include?(plane)
  	fail "Wait for better weather." if self.stormy?
  	# using delete instead of plane to get the actual plane called for instead of the last plane landed
  	@hangar.delete(plane)
  end

  def stormy?
    case rand(10)
    	when 0..8 then false
      else 
        true
    end
  end

end
