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
    fail "Plane is already at the airport" if in?(plane)
    fail "Bad weather" if @weather.stormy?
    fail "Airport is full" if full?

    @hangar << plane
  end

  def take_off(plane)
    fail "Plane is not at the airport" unless in?(plane)
    fail "Bad weather" if @weather.stormy?

    @hangar.delete(plane)
    puts "Plane: #{plane} took off"
  end

  private
  def full?
    @hangar.size == @capacity
  end

  def in?(plane)
    @hangar.include?(plane)
  end
end
