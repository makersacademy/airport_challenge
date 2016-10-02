class Airport
  attr_reader :planes

  def initialize
    @planes = []
  end

  def land_plane(plane)
    plane.land
    planes << plane if plane.landed?
  end

  def take_off(plane)
    raise "The plane is not in the airport!" if !planes.include?(plane)
    plane.take_off
    planes.delete(plane)
  end
end