require_relative 'plane'

class Airport

  attr_accessor :dock, :capacity

  DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @dock = []
  end

  def land(plane)
    raise "Airport dock is full" if full?

    @dock << plane
  end

  def take_off(plane)
    @dock.delete(plane)
  end
  
  def confirm_take_off(plane)
    !@dock.include?(plane) ? "Successful takeoff of plane: #{plane}" :
     "#{plane} still in dock"
  end

  private

  def full? 
    @dock.length >= @capacity
  end

end
