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
    if @hangar == ""
      return false
    else
      return true
    end
  end
end
