require_relative 'plane'
require_relative 'weather'

class Airport

  attr_reader :weather
  attr_reader :plane
  attr_reader :hangar

  def initialize
    @hangar = []
    @weather = Weather.new
  end

  def capacity(size)
    @size = size
  end

  def land(plane)
    if @weather.clear == false
      fail 'Plane cannot land in a storm.'
    else
      if @hangar.length < @size
        @hangar.push(plane)
      else
        fail 'Plane cannot land, airport is full.'
      end
    end
  end

  def take_off(plane)
    if @weather.clear == false
      fail 'Plane cannot take-off in a storm.'
    else
      @hangar.shift
    end
  end

end