class Airport

  attr_reader :name, :code, :planes

  def initialize(name, code)
    @name = name
    @code = code
    @planes = []
  end

  def receive(plane)
    @planes.push(plane)
    return true
  end

  def release(plane)
    @planes.delete(plane)
    return true
  end

  def contains?(plane)
    @planes.any? { |plane_in_airport| plane_in_airport == plane }
  end

end