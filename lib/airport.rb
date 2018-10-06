require 'weather'

class Airport

  DEFAULT_GROUND_FLEET_CAPACITY = 20

  attr_reader :ground_fleet, :capacity, :weather

  def initialize(
    capacity = DEFAULT_GROUND_FLEET_CAPACITY,
    weather = Weather.new
  )
    @ground_fleet = []
    @capacity = capacity
    @weather = weather
  end

  def arrive(plane)
    raise 'The ground fleet is at capacity' if full?
    raise 'The weather is too stormy to land' if @weather.stormy?
    @ground_fleet << plane
  end

  def depart
    raise 'No planes available in ground fleet' if empty?
    raise 'The weather is too stormy to takeoff' if @weather.stormy?
    @ground_fleet.pop
  end

  def full?
    @ground_fleet.count == @capacity
  end

  def empty?
    @ground_fleet.empty?
  end

end
