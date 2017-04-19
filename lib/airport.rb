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
    check_if_landed(plane)
    plane.landed
    confirm_landing
    hangar << plane
  end

  def take_off(plane)
    fail 'Too stormy to take off!' if weather.stormy?
    check_if_flying(plane)
    check_airport(plane)
    plane.flying
    confirm_take_off
    hangar.delete(plane)
  end

  def check_if_landed(plane)
    fail "Plane is already on the ground" if plane.airborne? == false
  end

  def check_if_flying(plane)
    fail "Plane is already airborne" if plane.airborne? == true
  end

  def check_airport(plane)
    fail "Plane is at another airport" if !hangar.include? plane
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
