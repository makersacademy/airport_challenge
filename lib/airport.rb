require_relative 'weather'

class Airport
include Weather

  attr_reader :landing_strip, :capacity

  def initialize
    @landing_strip = []
    @capacity = 10
  end

  def land(plane)
    plane.land!
    fail "Conditions are not right for landing" unless landing_clear?
    landing_strip << plane if landing_clear?
  end

  def take_off(plane)
    plane.take_off!
    landing_strip.delete(plane) unless stormy?
  end

  private

  def full?
    landing_strip.count == capacity
  end

  def stormy?
    weather_condition == 'stormy'
  end

  def landing_clear?
    true unless full? || stormy?
  end
end
