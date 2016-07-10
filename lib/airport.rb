require_relative 'plane'
require_relative 'weather'

class Airport
  attr_reader :plane, :weather, :capacity
  DEFAULT_CAPACITY = 5

  def initialize (capacity = DEFAULT_CAPACITY)
    @planes = []
    @weather = Weather.new
    @capacity = capacity
  end

  def land(plane)
    fail "We're full to bursting" if @planes.count > @capacity
    fail "ABORT ABORT! STORMY FRONTS ARE COMING" if @weather.stormy? == true
    @planes << plane
  end

  def takeoff(plane)
    fail "That plane isn't in the airport" unless @planes.include? plane
    fail "ABORT ABORT! STORMY FRONTS ARE COMING" if @weather.stormy? == true
    @planes.delete(plane)
  end
end
