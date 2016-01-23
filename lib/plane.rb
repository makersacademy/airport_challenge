class Plane
  def initialize
    @landed
  end

  def land(airport)
    @landed = true
    airport
  end

attr_reader :landed
alias_method :landed?, :landed

end