class Airport

  attr_accessor :planes_on_ground, :stormy, :capacity

  DEFAULT_CAPACITY = 8

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes_on_ground = []
    @stormy = true
    @capacity = capacity
  end

  def landing(plane)
    fail 'landing denied, airport capacity full' if @planes_on_ground.count >= @capacity
    fail 'landing denied, weather is stormy' if @stormy == true
    fail 'plane is already in the airport' if at_airport?(plane)
    @planes_on_ground << plane
  end

  def take_off(plane)
    fail 'plane is not currently at this airport' unless at_airport?(plane)
    fail 'weather is stormy, plane can not take off' if @stormy == true
    @planes_on_ground.delete(plane)
  end

  private
  def at_airport?(plane)
    @planes_on_ground.include?(plane)
  end

end
