class Airport
  
  attr_reader :plane, :capacity
  DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
    #@weather = weather
  end

  def land(plane)
    raise 'Airport is full' if full?
    #raise 'Too stormy to land.' if weather.stormy?
    plane.landed
    @planes.push(plane)
    plane
  end

  def takeoff(plane)
    raise "There are no planes in the airport." if @planes.empty?
    plane.flying
    @planes.delete(plane)
    puts report_taking_off
    plane
  end

  def report_taking_off
    return "Plane is no longer at the airport."
  end

  def full?
    @planes.length == DEFAULT_CAPACITY
  end

end
