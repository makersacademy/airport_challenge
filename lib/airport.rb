class Airport

  DEFAULT_CAPACITY = 10

  def initialize(weather, capacity=DEFAULT_CAPACITY)
    @planes = []
    @weather = weather
    @capacity = capacity
  end

  def land_plane(plane)
    raise 'Plane cannot land in stormy weather!' if weather.stormy?
    raise 'Plane cannot land - airport is full!' if full?
    plane.land
    @planes << plane
  end

  def take_off(plane)
    raise 'Plane cannot take off in stormy weather!' if weather.stormy?
    raise 'The plane is not in the airport!' if !has_plane?(plane)
    plane.take_off
    @planes.delete(plane)
  end

  def has_plane?(plane)
    @planes.include?(plane)
  end

  private
  attr_reader :weather

  def full?
    @planes.count == @capacity
  end

end
