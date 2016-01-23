class Plane
  def initialize
    @landed
  end

  def land(airport)
    raise "error: plane already landed" if @landed
    @landed = true
    airport
  end

attr_reader :landed
alias_method :landed?, :landed

end