require_relative 'plane'

class AirportController

  DEFAULT_CAPACITY = 20

  attr_reader :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = [Plane.new]
    @capacity = capacity
    @attempted_take_off = false
    @attempted_landing = false
  end

  def land_plane(plane)
    @attempted_landing = true
    check_for_landing_exceptions(plane)
    plane.report_landing
    @planes << plane
  end

  def check_for_landing_exceptions(plane)
    raise "The airport is full!" if airport_full?
    raise "This plane has already landed!" if plane_in_airport?(plane)
    raise "Landing not possible - bad weather!" if weather_is_bad && @attempted_landing
  end

  def plane_in_airport?(plane)
    @planes.include?(plane)
  end

  def weather_is_bad
    upper_bound = 100
    good_weather_upper_bound = 90
    number = rand(upper_bound)
    return true if number > good_weather_upper_bound
    false
  end

  def airport_full?
    return true if @planes.count >= @capacity
    false
  end

  def take_off_plane(plane = nil)
    @attempted_take_off = true
    released_plane = check_for_take_off_exceptions(plane)
    released_plane.report_take_off
    released_plane
  end

  def check_for_take_off_exceptions(plane)
    raise "There are no planes in the airport" if @planes.empty?
    raise "Take off not possible - bad weather!" if weather_is_bad && @attempted_take_off
    if plane.nil?
      released_plane = @planes.pop
    elsif @planes.include?(plane)
      released_plane = @planes.select {|airplane| airplane == plane}
    else
      raise "This plane has already taken off!"
    end
  end

  private

  def planes
    @planes
  end

end
