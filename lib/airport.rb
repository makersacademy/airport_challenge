require_relative 'plane' #use require relative up here
require_relative 'weather'
class Airport
  CAPACITY =  10

  attr_reader :plane_holder, :capacity

  def initialize (capacity=CAPACITY)
    @plane_holder= []
    @capacity=capacity
  end

  def land(plane)
    raise "can't land in a storm" if Weather.weather?
    raise "can't airport full" if full?
    plane.ground
    @plane_holder << plane
  end

  def take_off(plane)
    raise "can't fly win storm" if Weather.weather?
    delete_plane(plane)
  end

  private

  def delete_plane(plane)
    @plane_holder.delete plane
  end

  def full?
    @plane_holder.length >= @capacity
  end
end