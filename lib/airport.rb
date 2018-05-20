require_relative 'plane'
require_relative 'weather'

class Airport
  AIRPORT_CAPACITY = 11

  attr_reader :capacity, :planes

  def initialize(capacity = AIRPORT_CAPACITY)
    @capacity = capacity
    @plane = Plane.new
    @planes = Array.new(capacity, @plane)
    @forecast = Weather.new
  end

  def land(plane)
    fail "The airport is full" if airport_full?
    fail "Weather is too stormy to land" if @forecast.stormy? == true
    @planes << Plane.new
    puts "The plane has landed."
  end

  def take_off(plane)
    @planes.pop
    fail "Weather is too stormy to take off" if @forecast.stormy? == true
    puts "This plane has now departed"

  end

  def airport_full?
    planes.count >= capacity
  end

end
