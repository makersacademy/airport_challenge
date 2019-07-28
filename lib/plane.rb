class Plane
  attr_reader :location

  def initialize
    @location = :in_transit
  end

  def change_location(location = :in_transit)
    @location = location
  end

  def landing_check
    unless in_transit?
      raise "cannot land a plane which is already grounded"
    end
  end

  def flight_check
    if in_transit?
      raise "cannot take off while plane is in transit"
    end
  end

  private

  def in_transit?
    @location == :in_transit
  end


end