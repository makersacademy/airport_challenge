class Plane
  
  attr_accessor :landed
  alias_method :landed?, :landed
  
  def initialize(landed = false)
    @landed = landed
  end
end
