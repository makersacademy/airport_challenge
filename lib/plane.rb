class Plane

  attr_reader :flying, :landed

  def initialize
    @flying = false
    @landed = true
  end

  def is_flying?
    flying = true
  end

  def has_landed?
    landed = true
  end


end
