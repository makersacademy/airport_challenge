require_relative 'plane'

class Airport

  attr_reader :planes, :weather

  def initialize
    @planes = []
  end

  def cleared_landing(plane)
    @planes << plane
  end

  def cleared_takeoff(plane)
    if (self.weather) == 'sunny'
      @planes.delete(plane)
    else
      raise '#{self} has been grounded due to poor weather conditions'
    end
  end

  def weather
    rand(11) < 9? 'sunny' : 'stormy'
  end
end
