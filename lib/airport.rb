require_relative 'plane'
require_relative 'weather'

class Airport
  # capacity can be changed and read by attr_accessor
  # 'plane' and 'stormy' can only be read by attr_reader
  attr_accessor :capacity
  attr_reader :plane, :stormy

  #let the starting capacity be 10
  def  initialize(weather)
    @capacity = 10
    @stormy = weather.stormy?
  end

  def take_off
    fail "too stormy to take off!" if @stormy == true
    return Plane.new
  end

end
