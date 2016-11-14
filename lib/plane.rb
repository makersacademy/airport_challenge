class Plane

  attr_reader :status

  def initialize
    @status = :in_air
  end

  def status_to_in_airport
    @status = :in_airport
  end

  def status_to_in_air
    @status = :in_air
  end
end
