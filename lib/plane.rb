class Plane
  def initialize(airport = nil)
    airport.nil? ? @status = "air" : @status = "land"
    # airport.to_hangar(self) unless airport.nil?
    airport&.to_hangar(self)
  end

  def status?
    @status
  end

  def update_status(status)
    @status = status
  end
end
