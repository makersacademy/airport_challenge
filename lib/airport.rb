require_relative 'plane.rb'
require_relative 'weather.rb'

class Airport

  attr_reader :planes

  def initialize
    @planes = []
  end

  def arrival(plane, airport_size)
    # weather_error if stormy == true
    fail 'airport is full' if @planes.length == airport_size
    @planes << plane
    @planes.length
  end

  def departure
    # weather_error if stormy == true
    @planes.pop
    @planes.length
  end
end
