require_relative 'plane'

class Airport

  attr_reader :stored_planes
  attr_reader :capacity
  DEFAULT_CAPACITY = 100
  
  def initialize(weather_generator, stored_planes, capacity = DEFAULT_CAPACITY)
    @stored_planes = stored_planes
    @weather = weather_generator.generate_weather
    @capacity = capacity
  end

  def receive_plane(plane)
    raise "Plane already in airport" if @stored_planes.include?(plane)
    raise "Airport full" if full?
    @stored_planes << plane unless stormy? or plane.flying? == false
    @stored_planes
  end

  def release_plane(plane)
    raise "Plane not in airport" if @stored_planes.include?(plane) == false
    @stored_planes.delete(plane) unless stormy?
  end

  def stormy?
    @weather == "stormy"
  end

  def full?
    @stored_planes.count == @capacity
  end

  def change_capacity(capacity)
    @capacity = capacity
  end

end
