require_relative "./airport"

class Plane
  attr_accessor :in_air

  def initialize
    @in_air = true
  end

end
