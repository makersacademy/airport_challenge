require_relative 'plane'
require_relative 'weather'

class Airport

  attr_reader :planes, :capacity

  DEFAULT_CAPACITY = 30

  def initialize(capacity=DEFAULT_CAPACITY)
  	@planes = []
  	@capacity = capacity
  end

  def depart(weather)
  	fail "No planes" if @planes.empty?
  	fail "Bad weather" if weather.stormy?
    @planes.pop.taken_off
  end

  def land(plane, weather)
  	fail "Bad weather" if weather.stormy?
  	fail "Airport is full" if @planes.count >= capacity
  	plane.landed
  	@planes << plane
  end


end








