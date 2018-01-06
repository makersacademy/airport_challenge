
class Airport

  def initialize(storage = [])
    @storage = storage
  end

  def land(plane)
    @storage.push(plane)
  end

  def take_off(plane)
    @storage.delete(plane)
  end

  def show_planes
    @storage
  end

end
