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

end