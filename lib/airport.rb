class Airport
  attr_reader :planes, :capacity

  def initialize(capacity = 1)
    @capacity = capacity
    @planes = []
  end

  def add_plane(plane)
    planes << plane
  end

  def delete_plane(plane)
    planes.delete(plane)
  end

  def weather_conditions
    rand(2).zero? ? "stormy" : "sunny"
  end

  def bad_weather_error
    raise "The weather is stormy" if weather_conditions == "stormy"
  end

  def full?
    @planes.size == @capacity
  end

  def airport_full
    raise "The airport is full." if full?
  end

  def landed_before?(plane)
    raise "The plane has already landed in the airport." if plane.in?(self)
  end

  def exists?(plane)
    raise "The plane does not exist in the airport." unless plane.in?(self)
  end

end
