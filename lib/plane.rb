Plane = Class.new

class Plane

  attr_reader :flying, :airport

  def initialize
    @flying = true
    @airport = ""
  end

  def change_airport(airport)
    @airport = airport
  end

  def take_off
    @flying = true
  end

  def land
    @flying = false
  end

end
