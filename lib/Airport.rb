class Airport
  attr_reader :capacity
  attr_reader :docked_planes
  CAPACITY = 40

  def initialize(capacity = CAPACITY)
    @capacity = capacity #capacity refers to the number of planes in the airport
    @docked_planes = []
  end

  def dock_plane(*plane)
    plane.each do |plane|
      if @capacity > @docked_planes.count
        @docked_planes << plane
      else
        return "There are too many planes in the airport"
      end
    end
  end

  def undock_plane(*plane)
    plane.each do |plane|
      @docked_planes.delete(plane)
    end
  end

end
