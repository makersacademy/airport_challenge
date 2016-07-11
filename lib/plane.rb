class Plane
  attr_reader :status, :airport

  def initialize
    @status = :flying
  end

  def land(airport)
    fail 'the plane is already on the ground' if status == :landed
    @status = :landed
    @airport = airport
    status
  end

  def take_off(airport)
    @status = :flying
    @airport = :nil
    status
  end

end
