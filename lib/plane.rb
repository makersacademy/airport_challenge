class Plane
  $all_planes = Array.new

  def initialize(airport = nil)
    airport.nil? ? @status = "air" : @status = "land"
    airport&.to_hangar(self)
    $all_planes << self
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
    $airports.select { |airport| airport.in_hangar(self) }
  end
end
