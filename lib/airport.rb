require_relative 'plane'
require_relative 'weather'

class Airport

  attr_reader :airport_arr, :airport_weather, :plane

  def initialize(airport_weather = Weather.new, plane = Plane.new)
    @airport_arr = Array.new
    @airport_weather = airport_weather
    @plane = plane
  end

  def in_hangar?(plane)
    @airport_arr.include?(plane)
  end

  def bad_weather
    @airport_weather.stormy?
  end

  def land(plane)
    if bad_weather
      raise "You cannot land in a stormy weather!"
    elsif in_hangar?(plane)
      raise 'This plane is not flying.'
    else
      @plane.lands
      return @airport_arr.push(plane)
    end
  end

  def take_off(plane)
    if bad_weather
      raise "You cannot take off in a stormy weather!"
    elsif !in_hangar?(plane)
      raise 'This plane is already flying.'
    else
      @airport_arr.delete(plane)
      @plane.takes_off
      return "Plane took off!"
    end
  end

end
