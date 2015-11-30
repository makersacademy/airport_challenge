class Plane
  def initialize
    @flying = true
  end

  def take_off
    raise 'Plane cannot take off: plane already flying' if flying
  end

  def airport
    raise 'Plane cannot be at an airport: plane already flying' if flying
    @airport
  end

  def land(airport)
    raise 'Plane cannot land: plane is already landed' if landed == true
    @flying = false
    @airport = airport
  end

  private

  attr_reader :flying

  def landed
    !flying
  end
end



# class Plane
#
#
#
# end
