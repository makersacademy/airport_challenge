require_relative 'plane'
class Airport
  attr_accessor :planes

  def initialize
    @planes = []
    @flight_log = []
  end

  def land_plane(plane)
    #Overwrite planes array with a single plane for testing
    @planes << plane
    @flight_log << "Plane #{plane} landed"
    @flight_log.last
  end

  def take_off
    plane = @planes.pop
    @flight_log << "Plane #{plane} took off"
    puts @flight_log
    @flight_log.last
  end

  def flight_log
    @flight_log
  end

end
