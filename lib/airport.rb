
class Airport
  attr_reader :airport

  def initialize(storage = [])
    @storage = storage
  end

  def land(plane)
    @storage.push(plane)

  end

  def take_off(plane)
    @storage.delete_at(@storage.length-1)
  end

  def show_planes
    @storage
  end

end
