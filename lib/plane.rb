class Plane
  attr_reader :landed, :airport

  def land airport
    fail "#{self} already landed" if @landed
    @landed = true
    @airport = airport.object_id
  end

  def take_off airport
    fail "#{self} not at #{airport}" unless airport.object_id == @airport
    @landed = false
    @airport = nil
  end
end
