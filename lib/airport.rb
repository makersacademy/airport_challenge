require_relative 'plane'


class Airport
  attr_reader :capacity

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @docked_planes = []
  end

  def land_plane(plane)
    raise 'weather is stormy' if forecast == 'stormy'
    raise 'airport is full' if full?
    raise 'plane already at airport' if @docked_planes.include?(plane)
    @docked_planes << plane
    @docked_planes.last
  end

  def takeoff(plane)
    raise 'weather is stormy' if forecast == 'stormy'
    raise 'plane not at airport' if !@docked_planes.include?(plane)
    @docked_planes.delete(plane)
  end

  def forecast
    rand(15) == 3 ? 'stormy' : 'fine'
  end

  # def plane_already_at_airport?
  #   @docked_planes.uniq.length != @docked_planes.length
  # end

  def full?
    @docked_planes.length >= @capacity
  end

end
