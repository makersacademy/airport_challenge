class Plane

    attr_reader :flying

  def initialize
    @flying = true
  end

  def in_flight
    flying = true
  end

  def land
    flying = false
  end

end
