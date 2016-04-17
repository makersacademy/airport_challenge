require_relative 'weather'
require_relative 'plane'

class Airport
attr_reader :weather

  def initialize(weather = Weather.new)
    @weather = weather

  end

  def land(plane)
    true
  end

  def landed?(plane)
    true
  end

  def take_off(plane)
    if self.weather.stormy?
      raise 'Cannot take off because of the bad weather'
    else
      true
    end
  end

  def departed?(plane)
    true
  end

end







