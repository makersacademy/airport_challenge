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
    fail 'Warning: Hangar full' if airport_full?
    fail 'Plane already in hangar' if @hangar.include?(plane)

    @hangar.push(plane)
  end

  def weather_check
    @climate.check_conditions
  end

  def instruct_take_off(plane)
    fail 'Stormy weather - all flights grounded' unless weather_check == 'sunny'
    
    plane.take_off
    remove_from_hangar(plane)
  end

  def remove_from_hangar(plane)
    @hangar.delete(plane)
  end

  def confirm_plane_left(plane)
    @hangar.include?(plane)
  end

  def airport_full?
    @hangar.length == @capacity
  end

end
