require_relative './plane'
require_relative './weather'

class Airport
  DEFAULT_CAPACITY = 20
  attr_reader :hangar
  attr_accessor :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @hangar = []
    @climate = Weather.new
  end

  def land(plane)
    fail 'Warning: Hangar full' if full?

    @hangar.push(plane)
  end

  def weather_check
    @climate.weather_generator
  end

  def instruct_take_off(plane)
    fail 'Warning: stormy weather - all flights grounded' unless @climate.weather_generator == 'sunny'
    
    plane.take_off
    @hangar.delete(plane)
  end

  def confirm_plane_left(plane)
    @hangar.include?(plane)
  end

  def full?
    @hangar.length == @capacity
  end

end
