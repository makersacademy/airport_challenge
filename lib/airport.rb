class Airport
  
  attr_reader :plane, :capacity, :weather
  DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def land(plane, weather)
    raise 'Airport is full' if full?
    raise 'Too stormy to land.' if weather.stormy?
    plane.landed
    @planes.push(plane)
    plane
  end

  def takeoff(plane, weather)
    raise "There are no planes in the airport." if @planes.empty?
    raise 'Too stormy to take off.' if weather.stormy?
    plane.flying
    @planes.delete(plane)
    report_taking_off
    plane
  end

  def report_taking_off
    puts "Plane is no longer at the airport."
  end

  def full?
    @planes.length == DEFAULT_CAPACITY
  end

end
