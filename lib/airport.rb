require_relative './plane.rb'

class Airport

  attr_reader :hangar, :capacity

  DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY)
    @hangar = []
    @capacity = capacity
  end

  def land(plane)
    fail "Plane already at airport" if plane.in_hangar?
    fail "Hangar is full" if full?
    fail "Too stormy to land" if stormy?
    plane.land
    hangar.push(plane)
  end

  def take_off(plane)
    fail "Plane not at airport" unless plane.in_hangar?
    fail "Too stormy to take off" if stormy?
    plane.take_off
    hangar.delete(plane)
    "#{plane} has left the airport"
  end

  def stormy?
    weather.zero?
  end

  def weather
    @weather = rand(4)
  end

  private

  def full?
    hangar.length >= capacity
  end

end
