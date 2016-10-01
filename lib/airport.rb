require_relative 'plane'

class Airport
  attr_accessor :planes, :flight_log, :weather, :capacity

  def initialize(capacity = 10)
    @stormy = set_weather
    @planes = []
    @flight_log = []
    @capacity = capacity
  end

  def land_plane(plane)
    raise 'Cannot land due to no capacity' if at_capacity?
    raise 'Cannot land due to bad weather' if stormy?
    raise 'Plane has already landed' if plane_exists?(plane)
    @planes << plane
    @flight_log << "Plane #{plane} landed"
    @flight_log.last
  end

  def take_off(plane)
    raise 'Cannot take off due to bad weather' if stormy?
    raise 'Plane is not in the airport' unless plane_exists?(plane)

    runway = plane
    @planes.delete_if {|plane| plane = runway}
    @flight_log << "Plane #{plane} took off"
    @flight_log.last
  end

  def flight_log
    @flight_log
  end

  def stormy?
    @stormy == true
  end

  def at_capacity?
    @planes.length == @capacity
  end

  def plane_exists?(plane)
    @planes.include? plane
  end

  private
    def set_weather
      (rand < 0.95) ? @stormy = true : @stormy = false
    end
end
