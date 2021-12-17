class Airport
  attr_reader :hangar

  def send_to_hangar(plane)
    @hangar = plane
  end

  def taxi_to_runway(plane)
    @hangar = "" if plane
  end
end
