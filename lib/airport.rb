class Airport
  
  attr_accessor :planes

  def initialize
    @planes = []
  end

  def land(plane)
    raise 'Airport is full' if full?
    @planes.push(plane)
  end

  def take_off(plane)
    @left_airport = true
    @planes - [plane]
  end
  
  def left_airport?
    @left_airport
  end

  private

  def full?
    @planes.length == 1
  end
end
