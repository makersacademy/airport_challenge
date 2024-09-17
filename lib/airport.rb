require_relative 'plane'

class Airport
  attr_accessor :hangar, :stormy, :capacity, :forecast

  def initialize(capacity = 2)
    @hangar = []
    @capacity = capacity
    @forecast = rand(10)
    @forecast == 9 ? @stormy = true : @stormy = false  
  end
  
end