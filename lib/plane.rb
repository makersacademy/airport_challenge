class Plane

  attr_reader :flying

  def  initialize (flying = true)
    @flying = flying
  end

  def airborne
    @flying = true
  end

  def grounded
    @flying = false
  end
end
