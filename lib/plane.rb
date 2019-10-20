require_relative 'airport'
require_relative 'weather'

class Plane
  attr_reader :flying

  def left_airport
    @flying = true
  end

  def flying?
    @flying
  end
end
