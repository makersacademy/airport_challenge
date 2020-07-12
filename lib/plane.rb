class Plane
  attr_reader :flying
  def initialize(flying = true)
    @flying = flying
  end

  def flying?
    @flying
  end

  def land
    raise("You are not in flight") unless flying?

    @flying = false
  end

  def takeoff
    raise("You are not grounded") if flying?

    @flying = true
  end
end


