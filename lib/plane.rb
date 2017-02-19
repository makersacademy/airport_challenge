class Plane

attr_reader :airport

  def land(airport)
    @airport = airport
  end

  def takeoff
    @airport = nil
  end

  def landed?
    !@airport.nil?
  end

end
