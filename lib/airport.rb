require_relative './plane.rb'
require_relative './weather.rb'

class Airport
DEFAULT_CAPACITY = 3

  attr_reader :hanger
  attr_accessor :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @hanger = []
    @capacity = capacity
  end

  def land(plane)
    fail 'Airport Full' if full?
    fail 'That plane is not airborne, so cannot land' unless plane.airborne
    check_weather
    enter_hanger(plane)
    plane.down
  end

  def take_off(plane)
    check_weather
    leave_hanger(plane)
    plane.up
  end

  private

  def check_weather
    fail 'It is too dangerous to do that right now.' unless Weather.fair?
  end

  def enter_hanger(plane)
    fail 'this plane is already at this airport!' if hanger.include?(plane)
    hanger << plane
  end


  def leave_hanger(plane)
    fail 'this plane is not at this airport!' unless hanger.include?(plane)
    hanger.delete_if { |x| x == plane }
  end

  def full?
    hanger.size >= capacity
  end
end
