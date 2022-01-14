# frozen_literal_string: true

class Plane
  attr_reader :airborne

  def initialize
    @airborne = false
  end

  def takeoff
    @airborne = true
  end
end
