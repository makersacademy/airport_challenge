class Airport

  DEFAULTCAPACITY = 2

  def initialize(capacity = DEFAULTCAPACITY)
    @planes = [] # An array to hold the planes that take off and land at the airport
    @capacity = capacity # Represents the capacity of the airport
    @weather = Weather.new
  end

  # Plane lands at airport

  def lands_plane(arriving_plane)
    checks_for_landing(arriving_plane)
    planes << arriving_plane
    arriving_plane.arrives()
    "#{arriving_plane} has landed"
  end

# Plane takes off from airport

  def takes_off
    checks_for_take_off
    departing_plane = planes.pop
    departing_plane.departs()
    "#{departing_plane} has taken off"
  end

  private
  attr_reader :planes, :capacity

  # Checks the weather to see if it is safe at the airport

  def safe?
    @weather.weather_level > 1
  end

  # Checks to see if the airport has any planes

  def empty?
    planes.length.zero?
  end

  # Checks to see if the airport has no more space

  def full?
    planes.length == capacity
  end

  # Checks if the plane is flying

  def flying?(plane)
    plane.flying
  end

  # Checks if a plane can land at an airport

  def checks_for_landing(arriving_plane)
    raise 'This plane has already landed' unless flying?(arriving_plane)
    raise 'There is no more space at the airport' if full?
    raise 'It is too stormy for landing' unless safe?
  end

  # Checks if the plane can depart from the airport

  def checks_for_take_off
    raise 'There are no planes at the airport' if empty?
    raise 'It is too stormy for take off' unless safe?
  end
end
