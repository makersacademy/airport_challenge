require_relative 'plane'
require_relative 'weather'

class Airport

  attr_reader :planes, :capacity, :weather
  DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = Array.new
    @weather = Weather.new
  end

  def land(plane)
    @planes.push(plane) if can_land? plane
  end

  def take_off(plane)
    @planes.delete plane if can_take_off? plane
    "#{plane} is no longer in the airport"
  end

  private
  def at_capacity?
    @planes.size == @capacity
  end

  def can_land? plane
    raise "Airport has reached capacity: Cannot land plane" if at_capacity?
    raise "It is unsafe to land due to stormy conditions" if @weather.stormy?
    raise "This plane is already in the airport!" if @planes.include? plane
    true
  end

  def can_take_off? plane
    raise "There are no planes in the airport!" if @planes.size.zero?
    raise "It is unsafe to take off due to stormy conditions" if @weather.stormy?
    raise "This plane is not in the airport" unless @planes.include? plane
    true
  end
end
