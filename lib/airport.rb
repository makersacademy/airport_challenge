class Airport
  attr_reader :hangar

  def initialize
    @hangar = ""
  end

  def send_to_hangar(plane)
    @hangar = plane
  end

  def taxi_to_runway(plane)
    @hangar = "" if plane
  end

  def full?
    return false if @hangar == ""
    return true
  end
end
