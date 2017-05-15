class Airport

  DEFAULTCAPACITY = 2

  def initialize(capacity = DEFAULTCAPACITY, weather = Weather.new)
    @planes = []
    @capacity = capacity
    @weather = weather
  end

  def lands_plane(arriving_plane)
    checks_for_landing(arriving_plane)
    planes << arriving_plane
    arriving_plane.arrives()
    "#{arriving_plane} has landed"
  end

  def takes_off
    checks_for_take_off
    departing_plane = planes.pop
    departing_plane.departs()
    "#{departing_plane} has taken off"
  end

  private
  attr_reader :planes

  def checks_for_landing(arriving_plane)
    raise 'This plane has already landed' unless plane_airborn?(arriving_plane)
    raise 'There is no more space at the airport' if airport_full?
    raise 'It is too stormy for landing' unless sunny?
  end

  def checks_for_take_off
    raise 'There are no planes at the airport' if planes.empty?
    raise 'It is too stormy for take off' unless sunny?
  end

  def sunny?
    @weather.weather_level > 1
  end

  def airport_full?
    planes.length == @capacity
  end

  def plane_airborn?(plane)
    plane.flying
  end
end
