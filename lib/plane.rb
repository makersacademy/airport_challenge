class Plane
  attr_reader :landed_airport

  def initialize(landed_airport = nil)
    @landed_airport = landed_airport
  end

  def flying?
    @landed_airport == nil
  end

  def landed(airport)
    @landed_airport = airport
  end

  def take_off_from_airport
    @landed_airport = nil
  end

end
