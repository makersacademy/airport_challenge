require_relative 'plane.rb'
require_relative 'weather.rb'


class Airport

attr_accessor :capacity

DEFAULT_CAPACITY = 100
AIRPORT_CODE = "AMS"
FULL_MSG = "Sorry, this airport is currently full"
EMPTY_MSG = "Oops, there are no planes on the airport"
STORM_MSG = "SERVICE ALERT! Airport activity cancelled due to storms"
LANDED_MSG = "ERROR! Plane already landed"
TAKE_OFF_MSG = "ERROR! Plane already took off"

def initialize(capacity=DEFAULT_CAPACITY)
  @capacity = capacity
  @planes = []
end


  def land(plane)
    fail FULL_MSG if full?
    fail STORM_MSG if stormy?
    fail LANDED_MSG if planes.include?(plane)
    planes << plane
    landed_plane = planes.last
    landed_plane.arrival
    landed_plane.origin = AIRPORT_CODE
    "Plane #{plane} landed successfully"
  end

  def take_off(plane)
    fail EMPTY_MSG if empty?
    fail STORM_MSG if stormy?
    fail TAKE_OFF_MSG unless @planes.include?(plane)
    flying_plane = @planes.delete(plane)
    flying_plane.departure
    "Plane #{plane} took off successfully"
  end

  private

  attr_reader :planes

  def stormy?
    Weather.new.check_storm
  end

  def full?
    planes.length >= DEFAULT_CAPACITY
  end

  def empty?
    planes.empty?
  end

end
