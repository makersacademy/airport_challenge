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
