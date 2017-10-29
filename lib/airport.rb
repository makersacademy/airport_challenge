class Airport

  attr_reader :planes

  def initialize(planes = [])
    @planes = planes
  end

  def land(plane)
    raise "This plane is currently parked." unless plane.flying == true
    raise "The weather is too stormy to land, wait for further instructions.!" if check_stormy
    add_plane(plane)
  end

  def take_off(plane)
    raise "This plane is not at this airport." unless @planes.include?(plane)
    raise "The weather is too stormy to take-off, wait for further instructions.!" if check_stormy
    remove_plane(plane)
  end

    private

  def check_stormy
    Weather.new.stormy?
  end

  def remove_plane(plane)
    @planes.delete(plane)
  end

  def add_plane(plane)
    @planes.push(plane)
  end

end
