require_relative 'plane'
require_relative 'weather'


class Airport

  include Weather

  attr_reader :planes

  def initialize (capacity = 20)
    @planes = []
    @capacity = capacity
  end

  def land(plane) #creating a new method to land a plane
    raise "Weather is stormy" if @stormy
    raise "Airport full" if @planes.length >= @capacity
    @planes << plane
  end

  def take_off
    raise "Weather is stormy" if @stormy
    @planes.delete(@planes.sample)#creating a new instance of the plane class to take off
  end

end
