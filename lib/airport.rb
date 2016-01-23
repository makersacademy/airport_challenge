class Airport
  def initialize(capacity=DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
    @weather = Weather.new
  end

  attr_accessor :capacity
  DEFAULT_CAPACITY = 10

  def land(plane)
    raise "This plane has already landed." if docked?(plane)
    raise "This plane is already landed at another airport." if plane.landed == true
    raise "Can't land due to stormy weather" if weather.stormy?
    raise "This airport is full" if full?
    plane.landed = true
    planes << plane
  end

  def take_off(plane)
    raise "This plane is not at this airport." unless docked?(plane)
    raise "Can't take off due to stormy weather" if weather.stormy?
    planes.delete(plane)
    plane.landed = false
    plane
  end

  private
  attr_reader :planes, :weather

  def full?
    true if planes.length >= @capacity
  end

  def docked?(plane)
    true if planes.include?(plane)
  end

end