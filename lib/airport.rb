require_relative 'plane'
require_relative 'weather'

class Airport
  attr_reader :plane
  attr_reader :weather

  def initialize
    @planes = []
    @weather = Weather.new
  end

  def land(plane)
    @planes << plane
  end

  def takeoff(plane)
    fail "That plane isn't in the airport" unless @planes.include? plane
    fail "ABORT ABORT! STORMY FRONTS ARE COMING" if @weather.stormy? == true
    @planes.delete(plane)
  end
end
