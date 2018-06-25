require 'weather'

class Airport
  DEFAULT_CAPACITY = 50

  def initialize(weather = Weather.new, capacity = DEFAULT_CAPACITY)
    @number_of_planes = 0
    @capacity = capacity
    @weather = weather
  end

  def can_land?
    return false if full?
    return false if @weather.isStormy?
    true
  end

  def can_takeoff?
    !@weather.isStormy?
  end

  def landing plane
    @number_of_planes += 1
  end

  def takingoff plane
    @number_of_planes -= 1
  end

  private

  def full?
    @number_of_planes >= @capacity
  end
end
