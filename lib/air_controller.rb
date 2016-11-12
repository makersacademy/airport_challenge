require_relative 'plane'

class AirportController

  attr_reader :planes, :capacity

  def initialize(capacity = 20)
    @planes = []
    @capacity = capacity
  end

  def land_plane(plane)
    raise "This plane has already been landed!" if is_this_plane_in_the_airport?(plane)
    raise "The airport is full!" if is_airport_full?
    plane.report_landing
    @planes << plane
  end

  def is_this_plane_in_the_airport?(plane)
    @planes.include?(plane)
  end

  def is_airport_full?
    return false if @planes.empty?
    true
  end

  def take_off_plane
    raise "There are no planes in the airport" if @planes.empty?
    @planes.pop
  end



end
