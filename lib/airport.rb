require_relative './weather'

class Airport

  include Weather # currently supplies #stormy? in #weather_stormy?

  attr_reader :planes_on_ground, :capacity

  DEFAULT_CAPACITY = 8

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes_on_ground = []
    @capacity = capacity
  end

  def land(plane)
    land_checks(plane)
    @planes_on_ground << plane
  end

  def take_off(plane)
    take_off_checks(plane)
    @planes_on_ground.delete(plane)
  end

  private

  def land_checks(plane)
    fail 'plane is already in the airport' if at_airport?(plane)
    fail 'landing denied, airport full' if @planes_on_ground.count >= @capacity
    fail 'landing denied, weather is stormy' if weather_stormy? == true
  end

  def take_off_checks(plane)
    fail 'plane is not currently at this airport' unless at_airport?(plane)
    fail 'weather is stormy, plane can not take off' if weather_stormy? == true
  end

  def at_airport?(plane)
    @planes_on_ground.include?(plane)
  end

  def weather_stormy?
    stormy?
  end

end
