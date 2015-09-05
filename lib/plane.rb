class Plane

  attr_accessor :status

  def initialize
    @status = 'flying'
  end

  def land
    raise "You're already on the ground pilot.." if @status == 'landed'
    @status = 'landed'
  end

  def take_off
    raise "You're already in the air pilot.." if @status == 'flying'
    @status = 'flying'
  end

end
