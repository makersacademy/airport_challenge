# frozen_string_literal: true

require_relative 'plane'
require_relative 'weather'

# Airport class
class Airport
  attr_accessor :capacity, :planes
  DEFAULT_CAPACITY = 20

  def initialize(weather, capacity = DEFAULT_CAPACITY)
    @weather = weather
    @capacity = capacity
    @planes = []
  end

  def take_off(plane)
    taking_off_checks(plane)
    plane.taken_off
    planes.delete(plane)
  end

  def land(plane)
    landing_checks(plane)
    plane.landed
    planes << plane
  end

  private

  def full?
    planes.count >= capacity
  end

  def stormy?
    @weather.stormy?
  end

  def at_airport?(plane)
    @planes.include?(plane)
  end

  def taking_off_checks(plane)
    raise 'Cannot take off: Weather is stormy' if stormy?
    raise 'Cannot take off: Plane not at airport' unless at_airport?(plane)
  end

  def landing_checks(plane)
    raise 'Cannot land: Airport is full' if full?
    raise 'Cannot land: Weather is stormy' if stormy?
    raise 'Cannot land: Plane already at airport' if at_airport?(plane)
  end
end
