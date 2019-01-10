require_relative './plane.rb'

class Airport
  attr_accessor :plane
  def initialize
    @plane = Plane.new
    @something = 20
  end

  def land  
    @plane.land
  end

  def take_off
    @plane.take_off
  end
end