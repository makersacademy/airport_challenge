class Plane

  attr_accessor :flight_status

  def initialize
    @flight_status = :flying
  end

  def landed?
    @flight_status == :landed
  end

end
