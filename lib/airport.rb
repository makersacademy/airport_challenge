require_relative "airplane"

class Airport

  attr_accessor :capacity
  attr_accessor :airplanes 
  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @airplanes = Array.new
    @capacity = capacity
  end

  def land(airplane)
    fail "Airport is full" if full?

    @airplanes.push(airplane)
   
  end

  def take_off
    fail "No airplanes at airport" if empty?

    "#{@airplanes.pop} has taken off"
  end

  private 
  
  def full?
    @airplanes.count >= DEFAULT_CAPACITY
  end

  def empty?
    @airplanes.empty?
  end

end
