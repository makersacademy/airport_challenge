require_relative 'plane.rb'
require_relative 'weather.rb'
class Airport
  attr_reader :hangar, :capacity, :weather
  @@default_capacity = 1

  def initialize(capacity = @@default_capacity)
    @capacity = capacity
    @hangar = []
    @weather = Weather.new
  end

  def land(plane)
    fail "Bad weather" if @weather.stormy?
    fail "Airport is full" if is_full?
    @hangar << plane
  end

  def take_off(plane)
    fail "Bad weather" if @weather.stormy?
    @hangar.delete(plane)
    puts "Plane: #{plane} took off"
  end

  private
  def is_full?
    @hangar.size == @capacity
  end
end
