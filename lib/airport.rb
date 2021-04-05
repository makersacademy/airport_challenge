class AirportFull < StandardError
  def initialize(message)
    super(message)
  end
end

class Airport
  def initialize(plane, max_capacity = 3)
    @plane = plane
    @max_capacity = max_capacity
  end

  def land
    if @plane == @max_capacity
      raise AirportFull.new("Airport at maximum capacity")
    else
      @plane += 1
      puts "Plane has successfully landed"    
    end
  end

  def take_off
    @plane -= 1
  end
end