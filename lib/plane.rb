class Plane
  attr_accessor :location

  def initialize
    @location = "in transit"
  end

  def change_location(location = "in transit")
    @location = location
  end

  def landing_check
    unless @location == "in transit"
      raise "cannot land a plane which is already grounded"
    end
  end

  def flight_check
    if @location == "in transit"
      raise "cannot take off while plane is in transit"
    end
  end
end