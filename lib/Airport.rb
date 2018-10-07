require './lib/Plane.rb'
require './lib/Weather.rb'

class Airport

  DEFAULT_CAPACITY = 20

  attr_reader :capacity

  def initialize(value = DEFAULT_CAPACITY)
    @hangar = []
    @capacity = value
  end

  def land(plane)
    @plane = plane
    fail "BAD WEATHER: can't land" if stormy?
    fail "Can't land: HANGAR FULL" if full?
    fail "#{plane.name} is already in the hangar" if plane_in_hangar?
    plane_into_hangar
  end

  def take_off(plane)
    @plane = plane
    fail "BAD WEATHER: can't take off" if stormy?
    fail "#{plane.name} isn't in the hangar" if plane_in_hangar? == false
    plane_out_of_hangar
  end

  def hangar
    return 'empty' if empty?
    @hangar
  end

  private

  def empty?
    @hangar.count.zero?
  end

  def plane_into_hangar
    @hangar << @plane
  end

  def plane_out_of_hangar
    @hangar.delete(@plane)
  end

  def stormy?
    Weather.new.forecast == 'Stormy'
  end

  def full?
    @hangar.count == capacity
  end

  def plane_in_hangar?
    @hangar.include?(@plane)
  end

end
