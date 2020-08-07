require_relative 'plane'
class Airport
  DEFAULT_CAPACITY = 10

  def initialize 
    @hanger= []
  end

  def hanger(plane)
    raise "Hanger is full" if self.full?
    @hanger << plane
    @hanger[@hanger.length-1]
  end
  def take_off
    plane = @hanger.pop
    plane
  end

  def full?
    @hanger.length >= DEFAULT_CAPACITY
  end
end
