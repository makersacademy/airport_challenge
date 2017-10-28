class Airport

  def initialize(planes = [])
    @planes = planes
  end

  def land(plane)
    @planes.push(plane)
  end

  def take_off(plane)

  end

  def show_planes
    @planes
  end

end
