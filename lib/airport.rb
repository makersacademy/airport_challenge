class Airport
  attr_reader :planes
  def initialize
    @planes = []
  end

  def land(plane)
    @planes << plane
  end

  def take_off(off_plane)
    @new_planes = []
    @planes.each { |plane| @new_planes << plane if plane != off_plane }
    raise "Plane not at airport!" if @planes == @new_planes

    @planes = @new_planes
  end
end
