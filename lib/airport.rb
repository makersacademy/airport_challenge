require_relative "weather"
require_relative "plane"


class Airport

    attr_reader :planes
    attr_reader :capacity

    DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
    @in_flight_plane = []
  end

  def land_plane(plane)
    raise "This airport is full to capacity, please go to the next nearest airport to land" if full?
    raise "There is a storm at destination please divert to nearest airport" if stormy?
    @planes << plane

  end

  def take_off(plane)
     raise "All planes are grounded until further notice due to bad weather" if stormy?
     raise "Plane cannot take off as it is not currently in this airport" unless @planes.include? plane
     @in_flight_plane << plane
 end

private

  def full?
    @planes.count >= @capacity
  end

  def stormy?
    Weather.new.stormy?
  end


end
