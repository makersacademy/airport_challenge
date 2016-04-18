class Plane

  attr_reader :grounded

  def initialize
    @grounded = false
  end

  def grounded?
    @grounded
  end

  def arrive
    @grounded = true
  end

  def depart
    @grounded = false
  end

end

