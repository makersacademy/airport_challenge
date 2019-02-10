
class Plane
  DEFAULT_STATE = true
  attr_reader :flying

  def initialize
     @flying = DEFAULT_STATE
  end

  def land(airport)
    if landed
      raise "Plane already landed"
    end
    @airport = airport
    @flying = false
  end

  def takeoff(airport)
    if flying
      raise "Plane already flying"
    end
    if @airport != airport
      raise "Plane not present at this airport"
    end
    @airport = nil
    @flying = true
  end

  def landed
    !self.flying
  end
end
