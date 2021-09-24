module AirportContainer
  extend self

  attr_reader :capacity

  DEFAULT_CAPACITY = 50


  def initialize(capacity= DEFAULT_CAPACITY)
    @capacity = capacity
  end

  def view_capacity 
    @capacity
  end

end