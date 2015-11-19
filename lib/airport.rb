require_relative 'plane'
require 'weather'

class Airport

  DEFAULT_CAPACITY = 20
  attr_reader :planes

  def initialize (weather, capacity = DEFAULT_CAPACITY)
    @weather = weather
    @capacity = capacity
    @planes = []
  end

  def land(plane)
    fail 'Cannot land plane: airport is full.' if full
    fail 'Cannot land plane: weather is stormy.' if stormy?
    plane.land(self)
    add_plane(plane)
  end

  def take_off(plane)
    fail 'Cannot take off plane: weather is stormy.' if stormy?
    fail 'Cannot take off plane: plane not at this airport.' unless at_airport?(plane)
    plane.take_off
    remove_plane(plane)
    plane
  end

  private

  attr_reader :capacity, :weather

  def full
    planes.count >= capacity ? true : false
  end

  def at_airport?(plane)
    planes.include?(plane)
  end

  def add_plane(plane)
    planes << plane
  end

  def remove_plane(plane)
    planes.pop
  end

  def stormy?
    @weather.stormy?
  end

end

# extracting weather reporter to another class and not calling method on the instance of a class directly, but instead putting it in the initialize method, we can pass in any weather object, even if it is an API
