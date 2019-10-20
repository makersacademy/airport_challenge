require_relative 'airport'

class Plane

  def left_airport
    @flying = true
  end

  def flying?
    @flying
  end
end
