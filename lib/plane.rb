
class Plane < Airport

  def initialize
    @status = :in_flight
  end

  def land
    @status = :landed
  end

  def take_off
    @status = :in_flight
  end

  def status
    @status
  end

    # def clearance_from_airport
    #   clearance_for_landing
    # end

end
