require_relative 'plane'
require_relative 'weather'

class Airport

  def initialize
    @airport_arr = Array.new
  end

  def land
    @airport_arr.push(Plane.new)
  end

  def take_off
    @airport_arr.pop
    return 'Plane took off!'
  end

end
