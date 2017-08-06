require_relative 'plane.rb'
require_relative 'weather.rb'

class Airport
  DEFAULT_CAPACTIY = 2
  attr_reader :onground, :inair, :capacity

  def initialize(capacity = DEFAULT_CAPACTIY)
    @onground = []
    @inair = []
    @capacity = capacity
  end

  def land(plane, sunny = true)
    raise "it's too stormy to land!" if sunny != true
    raise "sorry, the airport is full" if full?
    @onground << plane
  end

  def take_off(sunny = true)
    raise "it's too stormy to take off!" if sunny != true
    raise "there are no planes to take off!" if @onground.count.zero?
    @inair << @onground.pop
  end

  def full?
    @onground.length >= @capacity
  end

end
