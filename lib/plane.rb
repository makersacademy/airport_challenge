class Plane
  def initialize
    @flying = true
  end

  def land
    raise 'Already landed' unless flying?

    @flying = false
  end

  def takeoff
    raise 'Already taken off' if flying?

    @flying = true
  end

  def flying?
    @flying
  end
end
