require_relative 'plane.rb'
class Airport
  attr_reader :planes
  DEFAULT_CAPACITY = 20
  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def weathergood?
    goodweather = ["sunny"]
    goodweather.include?(weather) ? true : false
  end

  def weather
    all_weathers = ["sunny", "stormy"]
    all_weathers[rand(2)]

  end

  def full?
    @planes.length == @capacity
  end

  def land_plane(plane)
    raise "The airport is full" if full?
    raise "Weather does not allow landing" unless weathergood?
    raise "Plane already landed at this airport" if @planes.index(plane)

    plane.land(self)

    @planes << plane
  end

  def take_off(plane)
    raise "Plane not at this airport" unless @planes.index(plane)

    plane.fly
    @planes.delete(plane)
  end

end
