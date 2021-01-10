require_relative 'plane'

class Airport
  def land(plane)
    full?
    @planes = plane
  end

  attr_reader :planes

  def take_off
    @planes
  end

  def full?
    fail 'Airport is full, plane cannot be landed.' if @planes
  end
end
