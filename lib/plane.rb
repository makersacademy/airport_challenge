class Plane

  attr_accessor :landed
  def in_airport?
    if @landed != true
      false
    else
      true
    end
  end

  def land
    @landed = true
  end
end
