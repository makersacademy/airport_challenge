class Plane
  attr_reader :status, :airport
  #remember public/private, only airport can tell the plane to take off
  def initialize
    @status = :flying
  end

  def land(airport)
    fail 'the plane is already on the ground' if status == :landed
    @status = :landed
    @airport = airport #need to get rid of @ but resolve variable names first, also this method does two things
    status
  end

  def take_off(airport)
    @status = :flying
    @airport = :nil
    status
  end


  #need an airport method for which airport in



end
