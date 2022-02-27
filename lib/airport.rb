require './lib/plane'

class Airport

  def initialize
    @plane = []

  def land(plane)
    full?
    @plane << plane
  end

  def take_off
    empty?
  end

  private

  def full?
    if @plane.size > @DEFAULT_CAPACITY
        raise Exception.new "Airport is full"
    end    
  end

  def empty?
    if @plane.empty?
        raise Exception.new "No plane yet"
    end

end