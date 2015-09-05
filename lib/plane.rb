class Plane

  attr_accessor :status

  def initialize
    @status = 'flying'
  end

  def land
    fail "You're already on the ground pilot.." if @status == 'landed'
    @status = 'landed'
  end

  def take_off
    # fail "You're already in the air pilot.." if @status == 'flying'
    @status = 'flying'
  end

end
