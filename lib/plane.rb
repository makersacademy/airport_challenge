require_relative 'airport'

class Plane 
  attr_reader :in_air

  def initialize(in_air = true)
    @in_air = in_air
  end
  # planes start landed, and when created they go in the hangar

  def flying
    @in_air = true
  end

  def landed
    @in_air = false
  end
end