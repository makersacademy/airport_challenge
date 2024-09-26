require_relative '../lib/plane.rb'

class Airport
  attr_accessor :planes, :MAX_CAPACITY

  def initialize(max_capacity=20)
    @planes = []
    @MAX_CAPACITY = max_capacity
  end  
end   

