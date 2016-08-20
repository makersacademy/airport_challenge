require_relative './plane.rb'
require_relative './weather.rb'

class Airport

  attr_reader :planes , :weather

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
    @weather = Weather.new
  end

  def land(plane)
    fail "Planes cannot land in stormy weather" if @weather.stormy
    fail "Planes cannot land when airport is full" if full?
    @planes << plane
  end

  def take_off(plane)
    fail "Planes cannot take off in stormy weather" if @weather.stormy
    @planes.delete(plane)
  end

  def full?
    planes.count == DEFAULT_CAPACITY
  end

end
