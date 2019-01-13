require_relative 'plane'
require_relative 'weather'

class Airport

  attr_reader :airport_weather, :plane
  attr_accessor :capacity, :airport_arr

  DEFAULT_CAPACITY = 2

  def initialize(airport_weather = Weather.new, capacity = DEFAULT_CAPACITY)
    @airport_arr = Array.new
    @airport_weather = airport_weather
    @capacity = capacity
  end

  def in_hangar?(plane)
    @airport_arr.include?(plane)
  end

  def bad_weather
    @airport_weather.stormy?
  end

  def hangar_full?
    @airport_arr.count == @capacity
  end

  def land(plane)
    raise "You cannot land in a stormy weather!" if bad_weather

    raise 'This plane is not flying.' if in_hangar?(plane)

    raise 'Hangar is full.' if hangar_full?

    plane.lands
    return @airport_arr.push(plane)
  end

  def take_off(plane)
    raise "You cannot take off in a stormy weather!" if bad_weather

    raise 'This plane is already flying.' unless in_hangar?(plane)

    @airport_arr.delete(plane)
    plane.takes_off
    return "Plane took off!"
  end

end
