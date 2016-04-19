class Airport

  require_relative 'plane'

  DEFAULT_CAPACITY = 50

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @storm_level = 1
    @capacity = capacity
  end

  def land(plane)
    fail 'Airport full' if airport_full?
    fail 'Plane cannot land in stormy weather' if stormy?
    fail 'Plane has already landed here' if landed? plane
    fail 'Plane has already landed elsewhere' if at_other_airport? plane
    @planes << plane
    plane.land
  end

  def take_off(plane)
    fail 'All planes have taken off' if airport_empty?
    fail 'Plane is not at this airport' unless at_airport? plane
    fail 'Plane cannot take off in stormy weather' if stormy?
    plane.take_off
    @planes.delete(plane)
  end

  def change_weather
    @storm_level = rand(10)
  end


  private

  def airport_full?
    @planes.length == @capacity
  end

  def airport_empty?
    @planes.empty?
  end

  def stormy?
    @storm_level == 9
  end

  def landed?(plane)
    @planes.include? plane
  end

  def at_airport?(plane)
    @planes.include? plane
  end

  def at_other_airport?(plane)
    !(@planes.include? plane) && plane.status == true
  end

end
