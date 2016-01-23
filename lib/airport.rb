require_relative 'plane'

class Airport
  attr_reader :capacity, :planes

  DEFAULT_CAPACITY = 50
  STORM_PERCENTAGE = 15

  def initialize
    @capacity = DEFAULT_CAPACITY
    @planes = []
  end

  def land(plane)
    raise 'Landing is not allowed in stormy weather' if stormy?
    plane.to_land
    planes << plane
  end

  def take_off(specific_plane)
    raise 'Take-off is not allowed in stormy weather' if stormy?
    departing = planes.select{|plane| plane == specific_plane}
    planes.select!{|plane| plane != specific_plane}
    departing
  end

  def contains?(specific_plane)
    planes.include?(specific_plane)
  end

  def stormy?
    true if rand(1..100) <= STORM_PERCENTAGE
  end



end
