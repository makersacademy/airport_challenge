
class Airport
  attr_reader :airport, :plane

  def initialize(storage = [])
    @storage = storage
  end

  def land(plane)
    @storage.push(plane)

  end

  def take_off(*)
    @storage.delete_at(@storage.length - 1)
  end

  def show_planes
    @storage
  end

end
