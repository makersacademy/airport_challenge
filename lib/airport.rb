require_relative 'plane'

class Airport

  DEFAULT_CAPACITY = 10

  attr_accessor :capacity
  attr_reader :weather


  def initialize
    @planes = []
    @capacity = DEFAULT_CAPACITY
    @weather='sunny'
  end

  def weather
    rand < 0.5 ? @weather = 'stormy' : @weather = 'sunny'
  end

  def take_off(plane)
    weather
    fail "No planes in airport" if empty?
    fail 'Plane cannot take-off due to bad weather' if stormy?
    planes.pop
  end

  def land_plane(plane)
    fail "Airport is full" if full?
    planes << plane
  end

  private

  attr_reader :planes

  def full?
    planes.count >= @capacity
  end

  def empty?
    planes.empty?
  end

  def stormy?
    @weather == 'stormy'
  end

end
