class Plane

  def initialize(grounded=nil)
    @grounded = grounded
  end

  def flying?
    @grounded == nil
  end

  def landing_process(airport)
    raise "This plane is on the ground" if flying? == false
    airport.land(self)
    @grounded = airport
  end





end
