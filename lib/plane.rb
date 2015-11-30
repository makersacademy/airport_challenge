class Plane

  attr_reader :flying

  def initialize
    @flying = true
  end

  def takeoff
    raise 'plane already in the air' if flying
  end

  def land
    @flying = false
    raise 'plane already landed' if landed
  end

end

private

def landed?
  !flying?
end
