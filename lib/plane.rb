class Plane

  attr_accessor :landed

  def initialize 
    @landed = false
  end

  def land
    raise 'plane has already landed' if @landed
    @landed = true
  end

  def take_off
    raise 'plane is already in the air' unless @landed
    @landed = false
  end

end
