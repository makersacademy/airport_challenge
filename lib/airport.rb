class Airport
  attr_reader :planes, :climate, :capacity
  def initialize(settings = {})
    @planes = []
    @capacity = settings.fetch(:capacity, 6)
    @climate = settings.fetch(:climate, 1)
  end

  def land(plane)
    check_land_safety
    planes << plane
    plane.land
  end

  def take_off(plane)
    check_can_take_off(plane)
    planes.delete(plane)
    plane.take_off
  end

  private

  def check_can_take_off(plane)
    fail "Can't find that plane!" unless planes.include? plane
    fail 'Stormy' if bad_weather?
  end

  def check_land_safety
    fail 'Airport full' if full?
    fail 'Stormy' if bad_weather?
  end

  def full?
    planes.length == @capacity
  end

  def bad_weather?
    true if rand(5 + climate) > 4
  end
end
