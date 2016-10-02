class Airport

  DEFAULT_CAPACITY = 10

  def initialize(weather, capacity=DEFAULT_CAPACITY)
    @planes = []
    @weather = weather
    @capacity = capacity
  end

  def land_plane(plane)
    raise 'Plane cannot land in stormy weather!' if stormy?
    raise 'Plane cannot land - airport is full!' if full?
    plane.land
    @planes << plane
  end

  def take_off(plane)
    raise 'Plane cannot take off in stormy weather!' if stormy?
    raise 'The plane is not in the airport!' if !has_plane?(plane)
    plane.take_off
    @planes.delete(plane)
  end

  def has_plane?(plane)
    @planes.include?(plane)
  end

  private

  def stormy?
    @weather.current_weather == :stormy
  end

  def full?
    @planes.count == @capacity
  end

end