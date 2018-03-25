require_relative 'plane'
require_relative 'weather'

class Airport

  attr_accessor :ramp
  attr_accessor :reg
  attr_accessor :weather

  attr_reader :capacity
  attr_reader :name

  DEFAULT_CAPACITY = 1

  def initialize(capacity = DEFAULT_CAPACITY, name = "gatwick")
    @capacity = capacity
    @name = name
    @ramp = []
    @weather = Weather.new.report
  end

  def land(plane)
    fail "Clearance refused due to inclement weather" if @stormy == true
    fail "Clearance refused due to congestion" if @ramp.length == @capacity
    plane.touchdown
    @ramp << plane
  end

  def takeoff(plane)
    fail "Clearance refused due to inclement weather" if @stormy == true
    plane.liftoff
    @ramp.pop
  end
end
