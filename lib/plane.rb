class Plane

  attr_reader :flying

  def  initialize (flying = false)
    @flying = flying
  end

  def airborne
    @flying = true
  end
end
