require_relative './weather.rb'

class Airport
  attr_reader :plane

  def land(plane)
    @plane = plane
  end

  def take_off(weather)
    raise "too dangerous to take off" if weather == 'stormy'
    @plane = nil
  end

  def contain?
    @plane
  end
end
