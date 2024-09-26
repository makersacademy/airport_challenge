# require_relative './plane'

class Airport

  attr_reader :runway, :capacity

  DEFAULT_CAPACITY = 10 
  
  def initialize(capacity=DEFAULT_CAPACITY)
  @runway = []
  @capacity = capacity
  end 

  def land_plane(plane)
    fail "Error, runway full" if runway_full?
    @runway << plane
  end 

  def take_off
    @runway.pop
  end 

  def check_runway(plane)
    @runway.include? plane
  end 

  private 

  def runway_full?
    @runway.count >= @capacity
  end 
end 