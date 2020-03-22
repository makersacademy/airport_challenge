class Airport
  attr_reader :planes
  def initialize
    @planes = []
  end

  def land(plane)
    raise "Cannot land - airport at capacity!" if @planes.length == 10
    @planes << plane
  end

  def take_off(off_plane)
    @new_planes = []
    @planes.each { |plane| @new_planes << plane if plane != off_plane }
    raise "Plane not at airport!" if @planes == @new_planes

    @planes = @new_planes
  end

  def plane_at_airport?(check_plane)
    @planes.each { |plane| return true if plane == check_plane }
    false
  end
end
