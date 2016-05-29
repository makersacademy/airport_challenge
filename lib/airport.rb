require_relative 'plane.rb'
require_relative 'weather.rb'


class Airport

attr_accessor :planes

def initialize(capacity=100)
  @capacity = capacity
  @planes = []
end


  def land(plane)
    raise "Impossible to land" if stormy?
    planes << plane
  end

  def take_off(plane)
    raise "Impossible to take off" if stormy?
    @planes.delete(plane)
  end

private

  def stormy?
    Weather.new.check_storm
  end

  def full?
  end


end
