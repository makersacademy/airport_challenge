require_relative 'plane'

class Airport

  attr_reader :planes, :weather

  def initialize
    @planes = []
  end

  def clear_landing(plane)
    if (self.weather) == 'sunny'
      @planes << plane
    else
      raise "#{plane} unable to land due to poor weather conditions"
    end
  end

  def clear_takeoff(plane)
    if (self.weather) == 'sunny'
      @planes.delete(plane)
    else
      raise "#{plane} has been grounded due to poor weather conditions"
    end
  end

  def weather
    rand(11) < 9? 'sunny' : 'stormy'
  end
end
