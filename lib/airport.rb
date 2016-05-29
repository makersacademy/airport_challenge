require_relative 'plane'

class Airport

  attr_accessor :planes, :capacity

  DEFAULT_CAPACITY = 30

  def initialize(capacity=DEFAULT_CAPACITY)
  	@planes = []
  	@weather = ["good", "stormy"]
  	@capacity = capacity
  end

  def depart
  	fail "No planes" if @planes.empty?
  	fail "Bad weather" if stormy?
    @planes.pop.taken_off
  end

  def land(plane)
  	fail "Bad weather" if stormy?
  	fail "Airport is full" if @planes.count >= capacity
  	plane.landed
  	@planes << plane
  end

  

  private 

  def stormy?
  	@weather[rand(2)] == "good" ? false : true
  end

end




