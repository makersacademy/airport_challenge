require_relative './plane'
require_relative './weather'

class Airport
  attr_reader :planes_in_airport
  attr_reader :capacity

  DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY)
    @plane = Plane.new
    @weather = Weather.new
    @planes_in_airport = []
    @capacity = capacity
  end

  def land(plane) 
    landing_checker(plane)
    plane.land
    @planes_in_airport << plane
  end

  def take_off(plane)
    take_off_checker(plane)
    plane.take_off
    @planes_in_airport.delete(plane)
  end

  def stormy
    @weather.stormy?
  end

  private

  def plane_in_airport?(plane)
    planes_in_airport.include?(plane)
  end

  def capacity_reached?
    @planes_in_airport.length >= @capacity
  end

  def landing_checker(plane)
    raise Exception.new(m_already_landed) if plane.landed == true
    raise Exception.new(m_storm_warning) if stormy 
    raise Exception.new(m_capacity_warning) if capacity_reached?
  end

  def take_off_checker(plane)
    raise Exception.new(m_not_in_airport) unless plane_in_airport?(plane)
    raise Exception.new(m_take_off_denied) if stormy
  end

  def m_not_in_airport
    "This plane doesn't exist in the airport"
  end

  def m_already_landed
    "This plane has already landed"
  end

  def m_storm_warning
    "No landings permitted due to the storm"
  end

  def m_capacity_warning
    "No landings permitted due to the airport being full"
  end

  def m_take_off_denied
    "No take offs permitted due to the storm"
  end
end
