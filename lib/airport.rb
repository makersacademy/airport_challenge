require_relative 'plane'

class Airport
  attr_reader :planes

  def initialize
    @capacity = 20
    @planes = []
  end

  def land_plane(plane)
    fail 'Airport Full' if @planes.count >= @capacity
    fail 'Stormy Weather' if stormy_weather?
    plane.land!
    @planes << plane
  end

  def plane_take_off(plane)
    fail 'Airport Empty' if @planes.empty?
    fail 'Stormy Weather' if stormy_weather?
    plane1 = @planes.delete(plane)
    plane1.take_off!
    plane1
  end

  private

  def stormy_weather?
    [true, false, false, false].sample
  end
end
