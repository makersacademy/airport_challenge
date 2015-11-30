class Plane

  def initialize
    @flying = true
  end

  def takeoff
    raise 'plane already in the air' if flying
  end

  def land(airport)
    raise 'plane already landed' if landed
    @flying = false
    @airport = airport
  end

  def airport
    raise 'plane already in the air' if flying
    @airport
  end

private

attr_reader :flying

def landed
  !flying
end

end
