class Plane

  attr_accessor :location

  DEFAULT_LOCATION = 'airborne'

  def initialize
    @location = DEFAULT_LOCATION
  end

  def land(airport)
    raise 'Plane already landed' if @location != DEFAULT_LOCATION
    @location = airport
  end

  def take_off
    @location = DEFAULT_LOCATION
  end

end