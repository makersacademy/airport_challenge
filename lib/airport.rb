require_relative 'plane'
class Airport
  CAPACITY =  10

attr_reader :plane_holder, :capacity


  def initialize (capacity=CAPACITY)
    @plane_holder= []
    @capacity=capacity
  end

  def land(plane)
      raise "can't land in a storm" if plane.weather?
      raise "can't airport full" if full?
      @plane_holder << plane
  end

  def landed
    @airport
  end

  def take_off(plane)
    raise "can't fly win storm" if plane.weather?
    @plane_holder.pop
  end

private
  def full?
    @plane_holder.length >= @capacity
  end
end