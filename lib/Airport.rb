require './lib/Plane.rb'
require './lib/Weather.rb'

class Airport

  def initialize
    @hangar = []
  end

  def land(plane)
    fail "BAD WEATHER: can't land" if stormy?
    fail "Can't land: HANGAR FULL" if @hangar.count == 1
    @plane = plane
    plane_into_hangar
  end

  def take_off(plane)
    fail "BAD WEATHER: can't take off" if stormy?
    @hangar.delete(plane)
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

  def stormy?
    Weather.new.forecast == 'Stormy'
  end

end
