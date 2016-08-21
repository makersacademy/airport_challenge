require_relative 'plane'
require_relative 'weather'

class Airport

  attr_reader :hangar
  attr_reader :weather

  def initialize
    @hangar = []
    @weather = Weather.new
  end

  def land(plane)
    fail 'Too stormy to land!' if weather.stormy?
    plane.landed
    confirm_landing
    hangar << plane
  end

  def take_off(plane)
    fail 'Too stormy to take off!' if weather.stormy?
    plane.flying
    confirm_take_off
    hangar.delete(plane)
  end

  def confirm_take_off
    puts "Take-off successful"
  end

  def confirm_landing
    puts "Landing successful"
  end

end
