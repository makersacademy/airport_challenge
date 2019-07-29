class Plane
  attr_reader :location

  def initialize
    @location = :in_transit
  end

  def change_location(location = :in_transit)
    @location = location
  end

  def landing_check
    raise "cannot land a plane which is already grounded" if landed?
  end

  def flight_check
    raise "cannot take off while plane is in transit" if in_transit?
  end

  private

  def in_transit?
    @location == :in_transit
  end
  
  def landed?
    @location != :in_transit
  end
end
