require_relative 'plane'
require_relative 'weather'

class Airport

  attr_reader :hangar, :weather, :capacity

  DEFAULT_CAPACITY = 50

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @hangar = []
    @weather = Weather.new
  end

  def land(plane)
    fail 'Too stormy to land!' if weather.stormy?
    fail 'Try another airport!' if full?
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

  private

  def full?
    hangar.count >= capacity
  end

end
