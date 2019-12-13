class Plane
  attr_accessor :is_flying

  @is_flying = false

  def initialize(flying = false)
    @is_flying = flying
  end

  def landed?(landed)
    landed ? @is_flying = false : @is_flying = true
  end
end
