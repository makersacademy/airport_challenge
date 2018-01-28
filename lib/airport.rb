require_relative 'plane'
require_relative 'weather'

class Airport

  DEFAULT_CAPACITY = 20

  attr_accessor :capacity
  attr_reader :storage

  def initialize(weather = Weather.new, capacity = DEFAULT_CAPACITY)
    @storage = []
    @weather = weather
    @capacity = capacity
  end

  def land(plane)
    fail "Too late mate - Plane is already down!" if storage.include?(plane)
    fail "No room at the Inn - Try another airport!" if full?
    fail "Storm's a-brewing - Better divert course!" if weather.stormy?
    plane.status = :grounded
    puts "#{plane} has now landed."
    storage << plane
  end

  def takeoff(plane)
    fail "No planes available" if empty?
    fail "You know we are flying right now, right?" unless storage.include?(plane)
    fail "Storm's a-brewing - Better hold tight!" if weather.stormy?
    plane.status = :airborne
    puts "#{plane} has now taken off"
    storage.delete(plane)
  end

  private

  attr_reader :weather

  def full?
    storage.length >= capacity
  end

  def empty?
    storage.empty?
  end
end
