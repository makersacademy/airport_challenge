require_relative 'weather'
class Plane
  def initialize
  end
  def land
    "The plane has landed"
  end
  def take_off(weather)
      fail "The weather is stormy" if weather == true
      "The plane has taken off"
  end
end
