class Plane
  def initialize(airport = nil)
    airport.nil? ? @status = "air" : @status = "land"
    airport&.to_hangar(self)
  end

  def status?
    @status
  end

  def flying?
    @status == "air"
  end

  def update_status(status)
    @status = status
  end

  def in_airport?
    # puts $airports[0]
    $airports.select { |airport| airport.in_hangar(self) }

  end
end
