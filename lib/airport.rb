require_relative 'plane'
require_relative 'weather'

class Airport

  attr_accessor :weather

  def initialize weather = Weather
    @weather = weather
  end

  def land plane

  end

  def take_off plane

  end

end
