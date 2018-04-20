class Airport
  attr_reader :planes

  CAPACITY = 20

  def initialize
    @planes = []
  end

  def land(plane, weather)
    raise "It's too stormy!" if too_stormy?(weather)
    raise 'Airport full.' if airport_full?
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

  def airport_full?
    @planes.size >= 20
  end
end
