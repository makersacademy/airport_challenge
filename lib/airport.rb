class Airport
  attr_reader :planes, :capacity
  DEFAULTCAPACITY = 2
  def initialize(capacity = DEFAULTCAPACITY)
    # An array to hold the planes that take off and land at the airport
    @planes = []
    @capacity = capacity
  end
  # Allows planes to land at an airport

  def lands_plane(arriving_plane)

    if arriving_plane.flying == false
      raise 'This plane has already landed'
    elsif planes.length == capacity
      raise 'There is no more space at the airport'
    elsif safe? == false
      raise 'It is too stormy for landing'
    else
      planes << arriving_plane
      arriving_plane.arrives()
      "#{arriving_plane} has landed"
    end
  end
  # Enables planes to depart from  an airport

  def takes_off
    raise 'There are no planes at the airport' if planes.length.zero?
    if  safe? == false
      raise 'It is too stormy for take off'
    else
    departing_plane = planes.pop
    departing_plane.departs()
    "#{departing_plane} has taken off"
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
