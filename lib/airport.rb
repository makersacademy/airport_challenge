require 'weather'

class Airport

  DEFAULT_CAPACITY = 20

  def initialize(current_weather, capacity = DEFAULT_CAPACITY)
    @current_weather = current_weather
    @planes = []
    @capacity = capacity
  end

  def dock(plane)
    fail "Weather is too stormy, cannot land" if current_weather.is_stormy?
    fail "Airport is full, cannot land" if full?
    planes << plane
  end

  def release
    fail "Weather is too stormy, cannot take off" if current_weather.is_stormy?
    planes.pop
  end

  private

  attr_reader :planes, :current_weather, :capacity
  
  def full?
    planes.size >= capacity
  end



end
