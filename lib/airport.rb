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
    @hangar << plane
  end

  def take_off_check_list
    raise 'Warning: stormy weather! Takeoff not allowed.' if stormy_weather?
  end

  def take_off
    take_off_check_list
    @hangar.pop
  end

  private

  def full?
    @hangar.length >= @capacity
  end

  def stormy_weather?
    @weather.stormy? == :stormy
  end
end
