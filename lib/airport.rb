require_relative 'weather'

class Airport
  attr_reader :hangar
  DEFAULT_CAPACITY = 20

  def initialize(weather, capacity = DEFAULT_CAPACITY)
    @hangar = []
    @weather = weather
    @capacity = capacity
  end

  def land(plane)
    raise "There is a storm, cannot land" if stormy?
    raise "Hangar is full, cannot land" if full?
    plane.land(self)
    add_plane(plane)
  end

  def take_off(plane)
    raise "There is a storm, can't take off" if stormy?
    raise "Error: Plane not at this airport" unless at_airport?(plane)
    plane.take_off
    remove_plane(plane)
    plane
  end

  private

  attr_reader :capacity, :weather

  def full?
    hangar.length >= capacity
  end

  def stormy?
    weather.stormy?
  end

  def add_plane(plane)
    hangar << plane
  end

  def remove_plane(plane)
    hangar.pop
  end

  def at_airport?(plane)
    hangar.include?(plane)
  end

end
