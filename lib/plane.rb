class Plane
  attr_reader :status, :airport
  #remember public/private, only airport can tell the plane to take off
  def initialize
    @status = :flying
  end

  def land(airport)
    @status = :landed
    @airport = airport #need to get rid of @ but resolve variable names first, also this method does two things
    status
  end


  def take_off

  end

end
