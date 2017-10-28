class Airport
  attr_reader :planes

  def initialize(planes = [])
    @planes = planes
  end

  def land(plane)
    raise "This plane is already at this airport." if @planes.include?(plane)
    add_plane(plane)
  end

  def take_off(plane)
    raise "This plane is not at this airport." unless @planes.include?(plane)
    remove_plane(plane)
  end

private

  def remove_plane(plane)
    @planes.delete(plane)
  end

  def add_plane(plane)
    @planes.push(plane)
  end

end
