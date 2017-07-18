require_relative 'plane'
require_relative 'weather'

class Airport
  CAPACITY = 1
  attr_accessor :weather

  def initialize weather = Weather
    @capacity = CAPACITY
    @weather = weather
    @planes = []
    @full = false
  end

  def full?
    @full
  end

  def land plane
    if !weather.stormy? && !full?
      plane.land
    else
      "Don't land. Unfavourable conditions" #raise error
    end
  end

  def take_off plane

  end

end
