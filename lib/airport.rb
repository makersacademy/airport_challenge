require_relative 'plane'
require_relative 'weather'

class Airport
  DEFAULT_CAPACITY = 10
  attr_reader :planes, :capacity, :weather

  def initialize(capacity=DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
    @weather = Weather.new
  end

  def prevent_landing
    raise 'Unable to land due to bad weather' if stormy?
  end

  def full_airport
    raise 'Airport is full' if full?
  end

  def has_landed
    raise 'Plane has landed earlier' if landed?
  end

  def land(plane)
    @planes << plane
    plane.land
  end

  def prevent_take_off
    raise 'Unable to take off due to bad weather' if stormy?
  end

  def no_planes
    raise 'No planes to take off' if empty?
  end

  def has_taken_off
    raise 'The plane has taken off earlier' if taken_off?
  end

  def take_off(plane)
    @planes.pop
    plane.take_off
  end
end

private
def stormy?
  @weather.stormy?
end

def full?
  true if @planes.count >= @capacity
end

def empty?
  true if @planes.empty?
end

def landed?
  @planes.last.landed? unless @planes.empty?
end

def taken_off?
  @planes.last.taken_off?
end
