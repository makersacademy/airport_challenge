require 'weather'
require 'plane'

class Airport

  DEFAULT_CAPACITY = 20

  def initialize(current_weather = Weather.new, capacity = DEFAULT_CAPACITY)
    @current_weather = current_weather
    @planes = []
    @capacity = capacity
  end

  def dock(plane)
    fail "Weather is too stormy, cannot land" if current_weather.is_stormy?
    fail "Airport is full, cannot land" if full?
    fail "Plane is already landed" if plane.is_flying == false
    plane.landed
    planes << plane
  end

  def release
    fail "Weather is too stormy, cannot take off" if current_weather.is_stormy?
    fail "Airport is empty, cannot take off" if empty?
    x = planes.pop
    x.taken_off
    x
  end

  private

  attr_reader :planes, :current_weather, :capacity

  def empty?
    planes.empty?
  end

  def full?
    planes.size >= capacity
  end



end
