class Airport
  attr_reader :planes
  DEFAULT_CAPACITY = 10

  def initialize(capacity: DEFAULT_CAPACITY, weather:)
    @capacity = capacity
    @planes = []
    @weather = weather
  end

  def land(plane)
    check_can_land
    
    plane.land
    @planes << plane
  end

  def check_can_land
    raise 'Plane cannot land as airport is full' if full?
    raise 'Cannot land due to stormy weather' if @weather.stormy?
  end

  def full?
    @planes.count == @capacity
  end

  def take_off(plane)
    check_can_take_off(plane)

    plane.take_off
    @planes.delete(plane)
  end

  def check_can_take_off(plane)
    raise 'Plane is not in this airport' unless in_airport?(plane)
    raise 'Cannot take off due to stormy weather' if @weather.stormy?
  end

  def in_airport?(plane)
    @planes.include?(plane)
  end

  private :full?, :check_can_take_off, :check_can_land 
end
