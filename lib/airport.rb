class Airport
  
  attr_accessor :plane

  def initialize
    @planes = []
  end

  def land(plane)
    @planes.push(plane)
  end

  def take_off(plane)
    @left_airport = true
    @planes - [plane]
  end
  

  def left_airport?
    @left_airport
  end

end
