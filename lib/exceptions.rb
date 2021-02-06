# custom errors and messages will be thrown when:
# planes request to land at a full airport
class CapacityError < StandardError
  attr_reader :msg
  def initialize
    @msg = 'Request Denied: Airport capacity full'
    super(msg)
  end
end
# planes request to take off from an airport it is not in
class AirportError < StandardError
  attr_reader :msg
  def initialize
    @msg = 'Request Denied: Plane not located in specified airport'
    super(msg)
  end
end
# planes request to land or take off during stormy weather
class WeatherError < StandardError
  attr_reader :msg
  def initialize
    @msg = 'Request Denied: Extreme weather'
    super(msg)
  end
end
# grounded planes are instructed to land
class LandingError < StandardError
  attr_reader :msg
  def initialize
    @msg = 'Plane is already grounded'
    super(msg)
  end
end
# airborne planes are instructed to take off
class TakeOffError < StandardError
  attr_reader :msg
  def initialize
    @msg = 'Plane is already in the air'
    super(msg)
  end
end
