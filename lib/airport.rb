require './lib/weather'

class Airport
  attr_reader :landed_planes, :default_capacity, :capacity

  attr_writer :weather, :landed_planes

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @weather = Weather.new
    @weather = @weather.random_weather

    @capacity = capacity
    @default_capacity = DEFAULT_CAPACITY
    @landed_planes = []

  end

  def land(plane)
    raise("Can't land plane. Airport is full.") unless @landed_planes.length < capacity
    raise("Can't land. It is stormy.") unless @weather == :sunny
    raise("This plane is already landed!") if @landed_planes.include?(plane)
    @landed_planes << plane
  end

  def take_off(plane)
    return raise("Can't take off. It is stormy.") unless @weather == :sunny
    return raise("This plane is not at the airport!") unless @landed_planes.include?(plane)
    @landed_planes.delete(plane)
    return @landed_planes
  end

  def at_airport?(plane)
    @landed_planes.include?(plane)
  end

end
