require_relative 'plane'
require_relative 'weather'

class Airport

  DEFAULT_CAPACITY = 100

  attr_reader :hangar, :weather
  attr_accessor :capacity

  def initialize(capacity = DEFAULT_CAPACITY, weather = Weather.new)
    @hangar = []
    @capacity = capacity
    @weather = weather
  end

  def land_check_list
    raise 'Airport capacity reached. No more landing allowed.' if full?
    raise 'Warning: stormy weather! Landing not allowed.' if stormy_weather?
  end

  def land(plane)
    land_check_list
    plane.landed
    @hangar << plane
  end

  def take_off_check_list(plane)
    raise 'Warning: stormy weather! Takeoff not allowed.' if stormy_weather?
    raise 'This plane has already taken off.' if left_airport?(plane)
  end

  def take_off(plane)
    take_off_check_list(plane)
    plane.taken_off
    @hangar.delete(plane)
  end

  private

  def full?
    @hangar.length >= @capacity
  end

  def stormy_weather?
    @weather.stormy? == :stormy
  end

  def left_airport?(plane)
    plane.grounded == false
  end
end
