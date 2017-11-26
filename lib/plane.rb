require_relative 'Airport'

class Plane

  attr_reader :status

  def initialize
    @status = "In the air"
  end

  def land(airport)
    @status = airport
  end

  def takeoff
    @status = "In the air"
  end





end
