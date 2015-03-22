# Ideas: servicing

class Plane
  attr_reader :flying
  attr_accessor :flight_number
  alias_method :flying?, :flying

  def initialize
    @flying = true
  end

  def land
    @flying = false
  end

  def take_off
    @flying = true
  end
end
