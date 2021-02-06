class CapacityError < StandardError
  attr_reader :msg
  def initialize
    @msg = 'Request Denied: Airport capacity full'
    super(msg)
  end
end

class AirportError < StandardError
  attr_reader :msg
  def initialize
    @msg = 'Request Denied: Plane not located in specified airport'
    super(msg)
  end
end

class WeatherError < StandardError
  attr_reader :msg
  def initialize
    @msg = 'Request Denied: Extreme weather'
    super(msg)
  end
end

class LandingError < StandardError
  attr_reader :msg
  def initialize
    @msg = 'Plane is already grounded'
    super(msg)
  end
end

class TakeOffError < StandardError
  attr_reader :msg
  def initialize
    @msg = 'Plane is already in the air'
    super(msg)
  end
end
