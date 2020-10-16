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
    fail "Plane is already at the airport" if is_in?(plane)
    fail "Bad weather" if @weather.stormy?
    fail "Airport is full" if is_full?
    @hangar << plane
  end

  def take_off(plane)
    fail "Plane is not at the airport" unless is_in?(plane)
    fail "Bad weather" if @weather.stormy?
    @hangar.delete(plane)
    puts "Plane: #{plane} took off"
  end

  private
  def is_full?
    @hangar.size == @capacity
  end

  def is_in?(plane)
    @hangar.include?(plane)
  end
end
