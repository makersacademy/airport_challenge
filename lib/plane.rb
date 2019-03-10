class Plane
  attr_accessor :landed

  def initialize(landed = false)
    # Plane landed default false as probably in air
    @landed = landed
  end

  # Predicate method to return false or true for landed
  def landed?
    landed
  end

end
