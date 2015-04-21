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
    planes << plane
  end

  def take_off(plane)
    take_off_failures(plane)
    planes.delete(plane)
    plane.take_off!
    plane
  end

  private

  def take_off_failures(plane)
    fail 'Airport Empty' if planes.empty?
    fail 'Stormy Weather' if stormy_weather?
    fail 'That plane is not in the airport' unless plane_in_airport?(plane)
  end

  def plane_in_airport?(plane)
    planes.any? { |element| element == plane }
  end

  def stormy_weather?
    [true, false, false, false].sample
  end
end
