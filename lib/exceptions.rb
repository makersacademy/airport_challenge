# when planes request to land at a full airport
class CapacityError < StandardError
  attr_reader :msg

  def initialize
    @msg = 'Request Denied: Airport capacity full'
    super(msg)
  end
end

# when planes request to take off from airports they are not in
class AirportError < StandardError
  attr_reader :msg

  def initialize
    @msg = 'Request Denied: Plane not located in airport'
    super(msg)
  end
end

# when planes request to land or take off during stormy weather
class WeatherError < StandardError
  attr_reader :msg

  def initialize
    @msg = 'Request Denied: Extreme weather'
    super(msg)
  end
end

# when grounded planes are instructed to land
class LandingError < StandardError
  attr_reader :msg

  def initialize
    @msg = 'Plane already grounded'
    super(msg)
  end
end

# when airborne planes are instructed to take off
class TakeOffError < StandardError
  attr_reader :msg

  def initialize
    @msg = 'Plane already airborne'
    super(msg)
  end
end
