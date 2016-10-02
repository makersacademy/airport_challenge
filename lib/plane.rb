class Plane
  attr_reader :airport

  def initialize
    @landed = nil
  end

  def landed?
    @landed
  end

  private

  def set_airport(airport)
    @airport = airport
    set_as_landed
  end

  def set_as_landed
    @landed = true
  end
end
