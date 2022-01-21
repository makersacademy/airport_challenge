# create a Plane class, with attribute of landed
class Plane
  attr_accessor :landed
  alias_method :landed?, :landed

  # Plane class will initialize as landed in the airport by default
  def initialize(landed=true)
    @landed = landed
  end
end
