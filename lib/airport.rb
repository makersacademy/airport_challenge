require_relative 'plane'
require_relative 'weather'

class Airport
  DEFAULT_CAPACITY = 3
  attr_reader :hangar, :weather
  attr_accessor :capacity

  def initialize(capacity = DEFAULT_CAPACITY, weather = Weather.new)
    @hangar = []
    @weather = weather
    @capacity = capacity
  end

  def take_off(plane)
    fail 'No planes available' if empty?
    fail 'Weather is stormy' if weather.stormy?
    @hangar.delete(plane)
    puts "Plane has taken off"
  end

  def land(plane)
    fail 'Airport is full' if full?
    fail 'Weather is stormy' if weather.stormy?
    @hangar << plane
    @hangar[-1]
  end

  private

  def full?
    @hangar.count >= capacity
  end

  def empty?
    @hangar.empty?
  end

end
