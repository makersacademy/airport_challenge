require_relative 'weather'

class Airport
  
  DEFAULT_CAPACITY = 30

  attr_accessor :planes
  attr_accessor :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    raise 'Airport is full' if full?

    raise 'Weather too bad' if weather == 'stormy'

    raise 'Plane is already in airport' if in_airport?(plane)

    @planes.push(plane)
  end

  def take_off(plane)

    raise 'Plane has already taken off' if in_airport?(plane) == false
    
    raise 'Weather too bad' if weather == 'stormy'

    @planes - [plane]
  end

  def weather
    condition = Weather.new
    condition.weather
  end

  def in_airport?(plane)
    @planes.include?(plane)
  end

  private

  def full?
    @planes.length >= @capacity
  end

end
