class Plane
  attr_reader :airport

  def land airport
    @airport = airport
  end

  def landed?
    airport
  end

  def take_off
    @airport = nil
  end
end
