require 'byebug'
require_relative 'weather'

class Airport

  DEFAULT_CAPACITY = 20

  attr_reader :planes, :capacity, :weather

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
    @weather = Weather.new
  end

  def land(plane)
    check_capacity
    fail "It is too stormy to land" if weather.stormy?
    @planes << plane
    "Plane landed at airport"
  end

  def take_off(plane)
    fail "It is too stormy to fly" if weather.stormy?
    "Plane has taken off from airport"
  end

  def check_capacity
    fail "Airport is full" if full?
  end

  def full?
    @planes.count >= @capacity
  end
end
