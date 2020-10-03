class Plane
  attr_reader :airport

  def land(airport)
    @airport = airport
  end

  def takeoff
    @airport = nil
  end

  def flying?
    @airport == nil
  end
end
