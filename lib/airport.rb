class AirportFull < StandardError
  attr_reader :action
  def initialize(message)
    super(message)
  end
end

class Airport
  def initialize=(plane = 0, max_capacity = 3)
    @plane = plane
    @max_capacity = max_capacity
  end
  
  def land
    if @plane == @max_capacity
      raise AirportFull.new("Airport at maximum capacity")
    else
      puts "Plane has successfully landed"
      @plane += 1
    end
  end

  def take_off
    @plane -= 1
  end
end