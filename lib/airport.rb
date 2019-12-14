require_relative 'plane'

class Airport

attr_accessor :dock, :capacity

  def initialize(capacity)
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
    !@dock.include?(plane) ? (puts "Successful takeoff of plane: #{plane}") : (puts "#{plane} still in dock")
  end

  private

  def full? 
    @dock.length >= @capacity
  end


end