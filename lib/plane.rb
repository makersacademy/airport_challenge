class Plane
  def initialize(state = :flying)
    @state = state
  end

  def land(airport)
    if @state == :flying
      airport.receive(self)
      @state = :landed 
      return "Plane landed at #{airport.name} (#{airport.code})"
    else
      return "I'm already at an airport!"
    end
  end

  def take_off(airport)
    if airport.contains?(self) && @state == :landed
      airport.release(self)
      @state = :flying
      return "Plane took off from #{airport.name} (#{airport.code})"
    else
      return "I'm not at that airport!"
    end
  end
end