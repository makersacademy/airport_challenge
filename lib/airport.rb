class Airport

  attr_accessor :planes, :capacity
  DEFAULTCAPACITY = 2
  def initialize(capacity = DEFAULTCAPACITY)
    # An array to hold the planes that take off and land at the airport
    @planes = []
    @capacity = capacity
  end
  # Allows planes to land at an airport

  def lands_plane(plane)

    raise 'There is no more space at the airport' if planes.length == capacity
    planes << plane
    "#{plane} has landed"
  end
  # Enables planes to depart from  an airport

  def takes_off

    raise 'There are no planes at the airport' if planes.length.zero?
    if safe? == false
      raise 'It is too story for take off'
    else
    plane_take_off = planes.pop
    "#{plane_take_off} has taken off"
  end
  end

  # Checks the weather to see if it is safe at the airport

  def safe?
    weather_level = self.weather
    if weather_level > 1
      true
    else
      false
    end
  end

  # Randomly generates the weather level

  def weather
    rand(7)
  end
end
