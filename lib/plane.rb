# frozen_literal_string: true

class Plane
  attr_reader :airborne

  def takeoff
    @airborne = true
    'the plane is now airborn'
  end

  def land
    @airborne = false
  end
end
