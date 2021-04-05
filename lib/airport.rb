require_relative "plane"
require_relative "weather"

class Airport
  attr_reader :hanger, :capacity
  DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY)
    @hanger = []
    @capacity = capacity
  end

  def land(plane)
    raise "The plane is already in the hanger. It cannot land again." if hanger.include? plane
    raise "The plane is not flying" if plane.flying? == false
    raise "The airport is full." if full?
    raise "The weather is stormy, no planes can land." if Weather.new.stormy?

    plane.land
    @hanger << plane
  end

  def takeoff(plane)
    raise "The plane is already flying" if plane.flying?
    raise "The plane is not in the hanger. It cannot takeoff." unless hanger.include? plane
    raise "The weather is stormy, no planes can takeoff." if Weather.new.stormy?
  
    plane.takeoff
    @hanger.delete(plane)
    puts "#{plane} has taken off"
  end

  def change_capacity(new)
    @capacity = new
  end

  private
  def full?
    hanger.size >= capacity
  end
end
