class Plane

  attr_reader :status

  def land
    @status = 'at_airport'
  end

  def takeoff
    @status = 'in_flight'
  end
end
