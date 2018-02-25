class Airport
  DEFAULT_CAPACITY = 20
  def initialize(name, weather = Weather, capacity = DEFAULT_CAPACITY)
    @hangar = []
    @capacity = capacity
    @name = name
    @weather = weather.new
  end

  def takeoff(plane)
    fail 'Plane not in airport' if !in_hangar
    fail 'Cannot takeoff, bad weather' if weather.stormy?
    fail 'Hangar empty' if hangar.count <= 0
    hangar.delete(plane)
    "#{plane.name} flight just taken off. #{name} has #{hangar.count} planes remaining"
  end

  def land(plane)
    fail 'Cannot land, bad weather' if weather.stormy?
    fail 'Cannot land, hangar is full' if full?
    fail "Plane already landed" if in_hangar
    hangar << plane
    "#{plane.name} has just landed.#{name} contains #{hangar.count} planes"
  end

  def full?
    hangar.count >= capacity
  end

  def in_hangar?(plane)
    hangar.include?(plane)
  end

  attr_reader :capacity, :hangar, :name, :weather
end
