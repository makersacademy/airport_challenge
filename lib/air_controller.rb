require_relative 'plane'
require_relative 'weather'

class AirportController

  DEFAULT_CAPACITY = 20

  attr_reader :planes, :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = [Plane.new]
    @capacity = capacity
    @attempted_take_off = false
    @attempted_landing = false
  end

  def land_plane(plane)
    @attempted_landing = true
    raise "The airport is full!" if airport_full?
    raise "This plane has already landed!" if plane_in_airport?(plane)
    raise "Landing not possible - bad weather!" if weather_is_bad && @attempted_landing
    plane.report_landing
    @planes << plane
  end

  def plane_in_airport?(plane)
    @planes.include?(plane)
  end

  def weather_is_bad
    number = rand(100)
    return true if number > 90
    false
  end

  def airport_full?
    return true if @planes.count >= @capacity
    false
  end

  def take_off_plane
    @attempted_take_off = true
    raise "There are no planes in the airport" if @planes.empty?
    raise "Take off not possible - bad weather!" if weather_is_bad && @attempted_take_off

    plane = @planes.pop
    plane.report_take_off
    plane
  end

end
