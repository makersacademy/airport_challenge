class Plane

  attr_reader :is_flying
  def initialize
    @is_flying = false
  end

  def landed?(hanger = true)
    hanger ? @is_flying = false : @is_flying = true
  end
end