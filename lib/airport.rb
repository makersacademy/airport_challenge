require_relative 'plane'

class Airport
  attr_reader :plane

  def land(plane)
    raise "The airport is full" if @plane
    @plane = plane
  end

  def take_off
    raise "No planes at the airport" unless plane
    plane
  end

end
