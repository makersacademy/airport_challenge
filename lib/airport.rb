class Airport
  attr_reader :planes

  def initialize
    @planes = []
  end

  def land(plane, weather)
    raise "It's too stormy!" if too_stormy?(weather)
    @planes.push(plane)
  end

  def take_off(plane, weather)
    raise "It's too stormy!" if too_stormy?(weather)
    @planes.delete(plane)
  end

  private

  def too_stormy?(weather)
    weather.stormy?
  end
end
