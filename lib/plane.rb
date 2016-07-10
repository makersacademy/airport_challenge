class Plane

  attr_accessor :airborne
  alias airborne? airborne

  def initialize
    @airborne = true
  end

  def down
    @airborne = false
  end

  def up
    @airborne = true
  end

end
